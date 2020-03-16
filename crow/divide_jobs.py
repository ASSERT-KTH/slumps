# -*- coding: utf-8 -*-
import os
import sys
import shutil

if __name__ == '__main__':
    folder = sys.argv[1]  # folder containing all programs
    items_per_job = int(sys.argv[2])  # maximum number of programs per job
    out = sys.argv[3]  # out folder
    timeout = int(sys.argv[4])  # timeout in seconds per program

    extra = ""

    if len(sys.argv) > 5:
        extra = " ".join(sys.argv[5:])

    jobs = []

    currentJob = []
    for i, file in enumerate(os.listdir(folder)):

        if i % items_per_job == 0 and len(currentJob) > 0:
            jobs.append(currentJob)
            currentJob = []

        currentJob.append(file)

    jobs.append(currentJob)

    # Create a folder for each job

    if os.path.exists(out):
        shutil.rmtree(out)

    os.mkdir(out)

    shStrip = open("%s/command.sh" % out, 'w')    
    mpiScript = open("%s/deploy_argo.yml" % out, 'w')

    mpiScript.write(
"""
apiVersion: argoproj.io/v1alpha1
  kind: Workflow
  metadata:
    generateName: slumps-distributed-
  spec:
    entrypoint: slumps-distributed
    templates:
    - name: slumps-distributed  
      steps:
      - - name: slumpsfy
          template: slumps-template
          arguments:
            parameters:
            - name: job_folder
              value: "{{item.job_folder}}"
          withItems:
""")

    for i, j in enumerate(jobs):
        jobName = "%s/job%s" % (out, i)
        jobFolder = "job%s"%i
        if os.path.exists(jobName):
            shutil.rmtree(jobName)

        os.mkdir(jobName)

        for file in j:
            shutil.copy("%s/%s" % (folder, file), "%s/job%s/%s" % (out, i, file))

        # Generate the script
        shStrip.write("docker run --name {job} -d -e TIMEOUT={timeout} {extra} -v $(pwd)/{job}:/input -v $(pwd)/{job}/out:/slumps/crow/out -v "
                      "$(pwd)/{job}/logs/:/slumps/crow/logs jacarte/slumps:app \n".format(timeout=timeout, job=jobFolder, extra=extra))
        mpiScript.write(
"""          - { job_folder: %s }\n"""%jobFolder)

    mpiScript.write(
"""
    - name: slumps-template
    inputs:
      parameters:
      - name: job_folder
    container:
      image: "jacarte/slumps:app"
      command: [python3.7]
      args: [-version] 
""")

    shStrip.close()
    mpiScript.close()