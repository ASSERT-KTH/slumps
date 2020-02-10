# $1 is the argo work name
argo get $1  | grep -i ✔ | wc -l
