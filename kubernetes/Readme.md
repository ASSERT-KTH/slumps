In this folder you can find the argo workflow definition to run the whole benchmark (Rosetta C code) in SLUMPs. Argo provides the way to parallelize every program-SLUMPs execution. 

For more information about Argo workflows and experiments parallelization, go to [this](https://www.ovh.com/blog/simplify-your-research-experiments-with-kubernetes/) address.

### Settings:
- If its an Azure Cluster: ```az aks get-credentials --resource-group myResourceGroup --name myAKSCluster```
- Create argo namespace: ```kubectl create ns argo```
- Install argo in the cluster: ```kubectl apply -n argo -f https://raw.githubusercontent.com/argoproj/argo/stable/manifests/install.yaml```
  - Forward argo ui: ```kubectl port-forward -n argo service/argo-ui 8001:80```
- Create admin role: ```kubectl create rolebinding default-admin --clusterrole=admin --serviceaccount=default:default```
- Ensure you have the minIO service deployed to collect the outputs: ```kubectl create ns minio```
  - Configure minIO service in the minio.yml file
  - Install minio: ```kubectl apply -n minio -f minio.yml```
- Config argo to look for minIO: ```kubectl edit cm -n argo workflow-controller-configmap```
  - Append the following:
  ```
  data:
  config: |
    artifactRepository:
      s3:
        bucket: my-bucket
        endpoint: minio-service.minio:9000
        insecure: true
        # accessKeySecret and secretKeySecret are secret selectors.
        # It references the k8s secret named 'argo-artifacts'
        # which was created during the minio helm install. The keys,
        # 'accesskey' and 'secretkey', inside that secret are where the
        # actual minio credentials are stored.
        accessKeySecret:
          name: argo-artifacts
          key: accesskey
        secretKeySecret:
          name: argo-artifacts
          key: secretkey
  ```
- Create the secret: ```kubectl create secret generic argo-artifacts --from-literal=accesskey="minio" --from-literal=secretkey="minio123"```
- Forward minio service to download and manage artifacts: ```kubectl port-forward -n minio service/minio-service 9000```
  - Create storage if needed with Read-Write permissions
- Set the number of concurrent threads in the ```parallelism``` setting in the yml file.

### Notes:
 - To run SLUMPs over a different repor:
 ```bash

  argo submit slumps.yml -p repo="<url of the repo to be clone>" -p folder="<folder address after cloning>" -p raw="<raw url in the online repo>"

 ```

Examples
 
 ```bash
  argo submit slumps.yml -p repo="https://github.com/KTH/slumps.git" -p folder="/slumps/benchmark_programs/rossetta/valid/no_input" -p raw="https://raw.githubusercontent.com/KTH/slumps/master/benchmark_programs/rossetta/valid/no_input"
 ```

```bash
  argo submit slumps.yml --watch -p repo="https://github.com/KTH/slumps.git" -p folder="/slumps/benchmark_programs/rossetta/resumed" -p raw="https://raw.githubusercontent.com/KTH/slumps/master/benchmark_programs/rossetta/resumed"

```

```bash
  argo submit slumps.yml --watch -p repo="https://github.com/KTH/slumps.git" -p folder="/slumps/benchmark_programs/rossetta/the_sixties" -p raw="https://raw.githubusercontent.com/KTH/slumps/master/benchmark_programs/rossetta/the_sixties"

```


```bash
argo submit --watch slumps_pararallel_exploration.yml  -p repo="https://github.com/kth-tcs/verificatum-vjsc.git" -p raw="https://raw.githubusercontent.com/kth-tcs/verificatum-vjsc/master/src/wasm" -p folder="verificatum-vjsc/src/wasm"
```
## Dashboard for kubernetes:
 - ```kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/v2.0.0-beta8/aio/deploy/recommended.yaml ```
 - ```kubectl proxy``` To access the dashboard in localhost
 - ```az aks get-credentials --admin -g tcs -n slumps-WASI``` To be able of monitoring the kubernetes cluster



## [Local deployment with minikube](https://kubernetes.io/docs/setup/learning-environment/minikube/)


## Useful scripts:

- get kubernetes token ```kubectl -n kubernetes-dashboard describe secret $(kubectl -n kubernetes-dashboard get secret | grep admin-user | grep token | awk '{print $1}')```
- List and copy speciic files ```find . -name \*.wasm -exec cp {} <directory> \;```
- Create execytion pattern ```find . -name \*.wasm -exec echo mill cli.run  \$pw/{}  \;```
- Extract all tgz from folder ```find . -type f -name "*.tgz" -exec tar -xf {}  \;```
