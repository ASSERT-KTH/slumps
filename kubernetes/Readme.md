In this folder you can find the argo workflow definition to run the whole benchmark (Rosetta C code) in SLUMPs. Argo provides the way to parallelize every program-SLUMPs execution. 

For more information about Argo workflows and experiments parallelization, go to [this](https://www.ovh.com/blog/simplify-your-research-experiments-with-kubernetes/) address.

### Settings:
- If its an Azure Cluster: ```az aks get-credentials --resource-group myResourceGroup --name myAKSCluster```
- Create argo namespace: ```kubectl create ns argo```
- Install argo in the cluster: ```kubectl apply -n argo -f https://raw.githubusercontent.com/argoproj/argo/v2.3.0/manifests/install.yaml```
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


## [Local deployment with minikube](https://kubernetes.io/docs/setup/learning-environment/minikube/)

