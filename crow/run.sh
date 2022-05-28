
service rabbitmq-server start 
sleep 3

rabbitmq-plugins enable rabbitmq_management
chown -R rabbitmq:rabbitmq /var/lib/rabbitmq/

rabbitmqctl add_user $BROKER_USER $BROKER_PASS 
rabbitmqctl set_user_tags $BROKER_USER administrator
rabbitmqctl set_permissions -p / $BROKER_USER ".*" ".*" ".*"

seep 2

redis-server --port 1010 --requirepass $REDIS_PASS  &

sleep 5

python3.9 run.py $@