program=$1

blocks=$(grep -o -E "LLVM instruction" $program | wc -l)
vars=$(pcregrep -M "Looking for a replacement for:\n.* = var\ninfer" $program | wc -l )
vars=$(($vars/3))

load=$(pcregrep -M "; For LLVM instruction:\n.*load.*\n; Looking for a replacement for:\n.*= var\ninfer" $program | wc -l)
load=$(($load/5))

diff=$(($blocks - $vars))

# pcregrep -M "Looking for a replacement for:\n.* = var\ninfer" $program 

name=$(echo $program | sed 's/\.[^.]*$//')
name=$(echo $name | sed 's/\.[^.]*$//')
ext=$(echo $program | sed 's/^.*\.//')

dir="/Users/javierca/Documents/Develop/slumps/logs"
threshold=10


#echo "Name" "# Blocks" "# Vars" "diff" "%" "Total" "Unique"
if test -f "/Users/javierca/Documents/traces/al_unique/$name/filelist"; 

	then

		unique=$(ls   /Users/javierca/Documents/traces/al_unique/$name | grep -E ".wasm" | wc -l)
		

		if [ $blocks -gt 0 ] && [ $blocks -lt 100 ]
			then
				if [ $unique -gt $threshold ]
					then
						total=$(cat /Users/javierca/Documents/traces/al_unique/before_rmdup.txt |  grep -E "$name " | cut -d' ' -f2)
						cloc=$(cat $name.c.cloc | awk '{print $5}')
						#echo $total $name
						echo $name,$cloc, $blocks,$(($vars)), $(($load)), $(($diff)),$((100*$vars/$blocks))%,$(($unique)),$(($total))
						#cp -r "/Users/javierca/Documents/traces/comb/$name" "/Users/javierca/Documents/Develop/slumps/200/$name"
						#cp -r "/Users/javierca/Documents/traces/traces_all/$name" "/Users/javierca/Documents/Develop/slumps/traces/"
				fi
		fi
	
fi
