**task - create a deployment named nginx-deployment in the default namespace using the nginx:latest image. set the CPU limit to 200m and memory limit to 256Mi. set the CPU request to 100m and memory request to 128Mi**


[yaml file](./4-resource_limit.yaml)

```bash
#create the deployment
kubectl apply -f 4-resource_limit.yaml

#verify the deployment
kubectl get pods

#get more info about the deployment
kubectl describe pod httpd-pod

#cleanup
kubectl delete pod httpd-pod
```