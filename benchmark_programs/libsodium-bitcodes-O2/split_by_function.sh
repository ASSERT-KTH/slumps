program=$1
name=$(echo $program | sed 's/\.[^.]*$//')
name=$(echo $name | sed 's/\.[^.]*$//')

csplit -k -f $name-  $program "/; entering Souper's runOnFunction()/" "{20000}"

mkdir -p $name

cp ./$name-* $name
cp get_stats.sh $name
cp run_all.sh $name