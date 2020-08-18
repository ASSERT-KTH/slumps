

r = open("programs.txt", 'r').readlines()

run_local = open("run_locally.sh", 'w')

counter = 1 

for l in r:
	if l:
		rep = l.replace("\n", "")
		run_local.write(f"./run_docker.sh {rep} &\n")
		if counter % 4 	== 0:
			run_local.write(f"echo '{100.0*counter/len(r)}' \n wait \n")
		counter += 1