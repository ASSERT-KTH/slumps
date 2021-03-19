mkdir -p kube


cd kube

control_c() {
    kill -9 $MONITOR_PID
    kill -9 $MINIO_PID
    kill -9 $BROKER_PID
    kill -9 $BROKER_PID2
    exit
}

trap control_c SIGINT

while [ -n "$1" ]; do

    case "$1" in
        -r)
            echo "Cleaning"
            kubectl delete all --all --all-namespaces
            rm *.yaml

            cp ../minio.yaml minio.yaml

            kubectl apply -f minio.yaml

            kompose convert -f ../docker-compose4kube.yml

        ;;
      -ol)

            echo "Cleaning"
            kubectl delete all --all --all-namespaces
        ;;
      -ed)

            kompose convert -f ../docker-compose4kube.yml
        ;;
      -d)
          echo "Deploying"
          services=$(for service in ./*.yaml; do echo -n $(basename $service)","; done)

          services=$(echo $services | sed 's/.$//')
          echo kubectl apply -f $services
          kubectl apply -f $services

        ;;
      -f)
          sleep 60s
          echo "Forwarding services"

          kubectl port-forward  service/redis-monitor 7843 &
          MONITOR_PID=$!

          kubectl port-forward   service/broker  8080 &
          BROKER_PID=$!

          kubectl port-forward   service/broker 5672  &
          BROKER_PID2=$!

          kubectl port-forward  service/minio-service 9000 &
          MINIO_PID=$!


          wait


        ;;

      -f0)
          echo "Forwarding services"

          kubectl port-forward  service/redis-monitor 7843 &
          MONITOR_PID=$!

          kubectl port-forward   service/broker  8080 &
          BROKER_PID=$!

          kubectl port-forward   service/broker 5672  &
          BROKER_PID2=$!

          kubectl port-forward  service/minio-service 9000 &
          MINIO_PID=$!


          wait


        ;;

        -h)

            echo "TODO help"
            exit
        ;;
    esac
    shift
done




cd ..