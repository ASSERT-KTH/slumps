az aks get-credentials --resource-group $1 --name $2
kubectl create ns argo
kubectl apply -n argo -f https://raw.githubusercontent.com/argoproj/argo/stable/manifests/install.yaml
kubectl create rolebinding default-admin --clusterrole=admin --serviceaccount=default:default

kubectl create ns minio
kubectl apply -n minio -f minio.yml 
kubectl edit cm -n argo workflow-controller-configmap


kubectl create secret generic argo-artifacts --from-literal=accesskey="minio" --from-literal=secretkey="minio123"