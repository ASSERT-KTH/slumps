redis-cli -p 9090 config set requirepass $REDIS_PASS
redis-cli -p 9090 config rewrite

python3 run.py $@