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
import json

markdown_template = """

\\begin{table}[H]

%\\resizebox{\\textwidth}{!}{
  \\begin{tabular}{l r r} 
  
      \\hline
      Program name & Program variants & Different program variants  \\\\
      %    &              &     &                   &          &           \\\\
      \\hline\\hline
      {% for item in summaries %}{{item.0}}      & {{item.1}}        & {{item.2}} \\\\
        \\hline 
      {% endfor %}
  \\end{tabular}
%}
\\end{table}


"""


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

        shutil.rmtree(swam_folder)

        os.mkdir(swam_folder)

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

        summary_file = open("summary.tex", 'w')

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

                
                '''if len(sha) > 1:
                    huge_candidates += 1

                    swamTemplate = Template(scala_template_for_swam)
                    content = swamTemplate.render(
                        namespace = l,
                        baseline = baseline,
                        variants = ",".join(map(lambda x: '"%s"'%x, filter(lambda x: x != baseline, variants))),
                        main = personalized_tests.get(l, ["None", "None"])[0],
                        test = personalized_tests.get(l, ["None", "None"])[1]
                    )

                    namespace = baseline.split(".")[0]

                    if not os.path.exists("%s/%s"%(swam_folder, namespace)):
                        os.mkdir("%s/%s"%(swam_folder, namespace))

                    # Copy files to common folder
                    if not os.path.exists("common"):
                        os.mkdir("common")

                    shutil.copy("out/%s/%s"%(l, baseline), "%s/%s/%s"%(swam_folder,namespace, baseline))

                    for p in variants:
                        shutil.copy("out/%s/%s"%(l, p), "%s/%s/%s"%(swam_folder, namespace, p))

                    tests.append(content)
#   '''

                if len(overall) > 1:
                    candidates += 1

                


        
        summary_items = sorted(summary.items(),key=lambda x: x[1][1], reverse=True)
        summary_items = [[a.replace("_", " "), b[0], b[1], b[2:]] for a, b in summary_items]
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

        open("meta.json", 'w').write(json.dumps(summary_items))



        #f = open("%s/../../souper/src/Generated.scala"%swam_folder, 'w')
        #f.write(Template(generated_template).render(overall = ",".join(tests)))
        #f.close()

        print("Program count: %s"%total)
        print("Valid: %s"%huge_candidates)
        print("Failed job: %s"%fail_to_job)

    if not os.path.exists("out"):
        extractall()
   # stat_programs("## 1 hour per program timeout\n\n", "/Users/javierca/Documents/Develop/swam/slumps/test/resources/slumps")
    stat_programs("## 1 hour per program timeout\n\n", "/Users/javierca/Downloads/test")


