import os
import tarfile
import shutil
import matplotlib.pyplot as plt
import re
import requests
from jinja2 import Template
import shutil
import hashlib
import sys
import webbrowser

generated_template = """
package swam
package slumps
package test

import cats.effect.IO
import swam.runtime.internals.interpreter.Frame

class Program(val namespace: String, val baseline: String, val variants: Seq[String], val main: Option[String],
              val setup: Option[Frame[IO] => Vector[Long]])

trait Generated {

}

object Generated {
  val t = Seq(
    {{overall}}
  )

}
"""

markdown_template = """
{{header}}
- **Number of programs**: {{program_count}} 
  - **Fail porting to WASM**: {{port_fail}} ({{"%10.2f%%" | format(port_fail/program_count*100)}})
  - **Success porting to WASM**: {{port_total}} ({{"%10.2f%%" | format(port_total/program_count*100)}})
      - **Programs with multiple variants**: {{more_than_one_total}} ({{"%10.2f%%" | format(more_than_one_total/program_count*100)}})
        - **Programs with multiple variants and at least one different to original**: {{more_than_one_diff_total}} ({{"%10.2f%%" | format(more_than_one_diff_total/program_count*100)}})
      - **Count for no optimization candidates**: {{no_opt_total}} ({{"%10.2f%%" | format(no_opt_total/program_count*100)}})
      - **Timeout**: {{total_timeout}} ({{"%10.2f%%" | format(total_timeout/program_count*100)}})

| Program Name  | Variants | Different variants  | Description |      Code     | Log File
| ------------- |:-------------------:| ------------------------------:|-------------|-----------|---------|
{% for item in summaries %}{{item.0}}      | {{item.1}}        | {{item.2}} | {{item.3 | join(". ") }}  | [{{item.0}}](https://raw.githubusercontent.com/KTH/slumps/master/benchmark_programs/rossetta/valid/no_input/{{item.0}}.c) | [{{item.0}}.slumps.log](logs/{{item.0}}.slumps.log)
{% endfor %}
"""

scala_template_for_swam = """
    new Program("{{namespace}}", "{{baseline}}", Seq({{variants}}) , {{main}}, {{test}})
"""

personalized_tests = dict(
    Palindrome_detection=["""Option("palindrome")""", """Option((m, f) => {
        val init = "abc"
        val offset = m.malloc(init.length)

        m.buffer.put(init.getBytes(), offset._1, init.length)

        f.pushInt(offset._1)

        Vector(offset._1.toLong)
      })"""],
      Fibonacci_sequence= ["""Option("fibb")""", """Option((f) => {
        Vector(1L, 1L, 30)
      })"""]
      
)

personalized_tests["Sorting_algorithms-Gnome_sort"] = ["""Option("gnome_sort")""", """Option(( f) => {

        f.pushInt(offset._1)
        f.pushLong(10L)
        Vector(offset._1.toLong, 10.toLong)
      })"""]

personalized_tests["Execute_HQ9+"] = [""" Option("runCode")""", """Option((f) => {
        val init = "input sentence"
        f.pushInt(offset._1)
        Vector(offset._1.toLong)
      })"""]

if __name__ == "__main__":
    
    personalized_tests = {}
    os.chdir(sys.argv[1])

    def sha256sum(filename):
        h  = hashlib.sha256()
        b  = bytearray(128*1024)
        mv = memoryview(b)
        with open(filename, 'rb', buffering=0) as f:
            for n in iter(lambda : f.readinto(mv), 0):
                h.update(mv[:n])
        return h.hexdigest()

    print("Number of programs: %s"%len(os.listdir(".")))

    def extractall():
        for l in os.listdir("."):
            if os.path.isdir("%s"%l):
                for inner in os.listdir(l):
                    if inner.endswith(".tgz"): # decompress
                        t = tarfile.open("%s/%s"%(l, inner), 'r:gz')
                        print("Extracting %s/%s"%(l, inner))
                        t.extractall()
                        t.close()

    # list programs

    def getcode(name):
        return requests.get("https://raw.githubusercontent.com/KTH/slumps/master/benchmark_programs/rossetta/valid/no_input/%s.c"%name).text

    def stat_programs(header, swam_folder):

        #shutil.rmtree(swam_folder)

        #os.mkdir(swam_folder)

        total_dis = []
        diff_dis = []
        summary = {}
        fail = 0
        total = 0
        success = 0
        no_candidates = 0
        no_subexpressions = 0
        huge_candidates = 0
        candidates = 0
        timeout = 0
        fail_to_job = 0

        summary_file = open("summary.md", 'w')

        tests = []
        texts = []



        for l in os.listdir("out"):
            if os.path.isdir("out/%s"%l):
                sha = set()
                variants = []
                overall = []
                baseline = ""
                # look for baseline
                try:
                    baseline = list(filter(lambda x: x.endswith(".wasm") and not x.startswith("["), os.listdir("out/%s"%l)))[0]
                    sh = sha256sum("out/%s/%s"%(l, baseline))
                    overall.append(sh)
                    sha.add(sh)
                    variants.append(baseline)
                except Exception as e:
                    fail_to_job += 1
                    print(e, l)
                    

                for wa in os.listdir("out/%s"%l): # sanitizing
                        
                    if wa.endswith(".wasm"):
                        sh = sha256sum("out/%s/%s"%(l,wa))
                        if sh not in sha:
                            variants.append(wa)
                        overall.append(sh)
                        sha.add(sh)

                        if not wa.startswith("["):
                            baseline = wa
                print(sha)
                print(variants)
                total += 1

                total_dis.append(len(overall))
                diff_dis.append(len(sha))
                summary[l] = [len(overall), len(sha)]
                
                content = open("logs/%s.slumps.log"%l, 'r').read()

                if len(overall) == 0:
                    fail += 1
                    summary[l].append("Fail to port")
                    #summary[l].append(content)
                    #summary[l].append("\n```C\n%s\n```\n"%getcode(l))
                else:
                    success += 1

                if len(overall) == 1:
                    no_candidates += 1
                    summary[l].append("No variants generated")

                    # load log
                    #print(content)
                    if re.compile(r"Found \d+ arithmetic expression candidates").search(content):
                        m = [int(r) for r in re.compile(r"Found (\d+) arithmetic expression candidates").findall(content)]
                        m = max(m)

                        if m == 0:
                            no_subexpressions += 1
                            summary[l].append("No optimization candidates in the original program")

                    if re.compile(r"due to timeout").search(content):
                        timeout += 1
                        summary[l].append("Timeout in the exploration stage")

                
                if len(sha) > 1:
                    huge_candidates += 1

                    swamTemplate = Template(scala_template_for_swam)
                    content = swamTemplate.render(
                        namespace = l,
                        baseline = baseline,
                        variants = ",".join(map(lambda x: '"%s"'%x, filter(lambda x: x != baseline, variants))),
                        main = personalized_tests.get(l, ["None", "None"])[0],
                        test = personalized_tests.get(l, ["None", "None"])[1]
                    )


                    # Copy files to common folder
                    if not os.path.exists("common"):
                        os.mkdir("common")

                    #shutil.copy("out/%s/%s"%(l, baseline), "%s/%s"%(swam_folder,baseline))

                    #for p in variants:
                    #    shutil.copy("out/%s/%s"%(l, p), "%s/%s"%(swam_folder, p))

                    tests.append(content)
#

                if len(overall) > 1:
                    candidates += 1

                


        
        summary_items = sorted(summary.items(),key=lambda x: x[1][1], reverse=True)
        summary_items = [[a, b[0], b[1], b[2:]] for a, b in summary_items]
        #print(summary)
        markdownFinal = Template(markdown_template)
        content = markdownFinal.render(
            program_count=total,
            header=header,
            port_fail=fail,
            port_total=success,
            more_than_one_total=candidates,
            more_than_one_diff_total=huge_candidates,
            only_one_total=no_candidates,
            no_opt_total=no_subexpressions,
            total_timeout=timeout,
            summaries = summary_items
        )
        summary_file.write(content)


        #f = open("%s/../../souper/src/Generated.scala"%swam_folder, 'w')
        #f.write(Template(generated_template).render(overall = ",".join(tests)))
        #f.close()

        print("Program count: %s"%total)
        print("Valid: %s"%huge_candidates)
        print("Failed job: %s"%fail_to_job)

        webbrowser.get("chrome").open("file://%s"%os.path.realpath("summary.md"), new = 2)
        #webbrowser.open()

        #webbrowser.open("http://google.com", new = 2)

        #fig, ax = plt.subplots(figsize=(6, 6))
        #ax.violinplot([diff_dis], widths=2.0)          
        #plt.show()
    if not os.path.exists("out"):
        extractall()
   # stat_programs("## 1 hour per program timeout\n\n", "/Users/javierca/Documents/Develop/swam/slumps/test/resources/slumps")
    stat_programs("## 1 hour per program timeout\n\n", "/Users/javierca/Downloads/test")


