program=$1


function=$(cat $program | grep -R "entering Souper's runOnFunction() for" | cut -d' ' -f7)
blocks=$(grep -o -E "LLVM instruction" $program | wc -l)
vars=$(pcregrep --buffer-size=500000K -M "Looking for a replacement for:\n.* = var\ninfer" $program | wc -l )
vars=$(($vars/3))

load=$(pcregrep --buffer-size=500000K -M "; For LLVM instruction:\n.*load.*\n; Looking for a replacement for:\n.*= var\ninfer" $program | wc -l)
load=$(($load/5))

diff=$(($blocks - $vars))

# pcregrep -M "Looking for a replacement for:\n.* = var\ninfer" $program 

name=$(echo $program | sed 's/\.[^.]*$//')
name=$(echo $name | sed 's/\.[^.]*$//')
ext=$(echo $program | sed 's/^.*\.//')

dir="/Users/javierca/Documents/Develop/slumps/logs"
threshold=10


#echo "Name" "# Blocks" "# Vars" "diff" "%" "Total" "Unique"

#unique=$(ls   /Users/javierca/Documents/traces/al_unique/$name | grep -E ".wasm" | wc -l)


if [ $blocks -gt 0 ]
	then
		total=$(cat /Users/javierca/Documents/traces/al_unique/before_rmdup.txt |  grep -E "$name " | cut -d' ' -f2)
		#cloc=$(cat $name.c.cloc | awk '{print $5}')
		#echo $total $name
		echo $name,$function, $blocks,$(($vars)), $(($load)), $((100*$vars/$blocks))%
		#cp -r "/Users/javierca/Documents/traces/comb/$name" "/Users/javierca/Documents/Develop/slumps/200/$name"
		#cp -r "/Users/javierca/Documents/traces/traces_all/$name" "/Users/javierca/Documents/Develop/slumps/traces/"

fi
	
