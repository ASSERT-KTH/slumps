for key in "$(redis-cli -p $1 keys \*)";
  do echo "Key : $key"
     redis-cli -p $1 GET $key;
done