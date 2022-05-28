services=$(for service in ./*.yaml; do echo -n $(basename $service)","; done)

services=$(echo $services | sed 's/.$//')
echo kubectl apply -f $services
kubectl apply -f $services