# -*- coding: utf-8 -*-
import os
import sys
import shutil


def divide_jobs(programs_dir, max_programs_per_job, out_dir, timeout, extra=""):

    if os.path.exists(out_dir):
        raise Exception(
            f"Remove output directory first before executing: {out_dir}")
        shutil.rmtree(out_dir)  # Not running this on my machine

    os.mkdir(out_dir)

    jobs = []
    currentJob = []
    for i, file in enumerate(os.listdir(programs_dir)):
        if i % max_programs_per_job == 0 and len(currentJob) > 0:
            jobs.append(currentJob)
            currentJob = []
        currentJob.append(file)
    jobs.append(currentJob)

    shStrip = open(f"{out_dir}/command.sh", 'w')
    mpiScript = open(f"{out_dir}/deploy_argo.yml", 'w')

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

    for counter, job in enumerate(jobs):
        jobName = f"{out_dir}/job{counter}"
        jobFolder = f"job{counter}"

        os.mkdir(jobName)

        for file in job:
            shutil.copy(f"{programs_dir}/{file}",
                        f"{out_dir}/job{counter}/{file}")

        # Generate the script
        shStrip.write(f"docker run --name {jobFolder} -d -e TIMEOUT={timeout} {extra} -v $(pwd)/{jobFolder}:/input -v $(pwd)/{jobFolder}/out:/slumps/crow/out -v "
                      "$(pwd)/{jobFolder}/logs/:/slumps/crow/logs jacarte/slumps:app \n")
        mpiScript.write(
            """          - { job_folder: %s }\n""" % jobFolder)

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


if __name__ == '__main__':
    programs_dir = sys.argv[1]  # folder containing all programs
    max_programs_per_job = int(sys.argv[2])
    out_dir = sys.argv[3]
    timeout_per_program = int(sys.argv[4])

    extra = ""
    if len(sys.argv) > 5:
        extra = " ".join(sys.argv[5:])

    divide_jobs(programs_dir, max_programs_per_job,
                out_dir, timeout_per_program, extra)
