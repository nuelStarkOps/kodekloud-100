An application deployed on the Kubernetes cluster requires an update with new features developed by the Nautilus application development team. The existing setup includes a deployment named nginx-deployment and a service named nginx-service. Below are the necessary changes to be implemented without deleting the deployment and service:


1.) Modify the service nodeport from 30008 to 32165

2.) Change the replicas count from 1 to 5

3.) Update the image from nginx:1.19 to nginx:latest


## check current deployment and service
```bash
kubectl get deployment nginx-deployment # Notice the Ready column --> 1/1
kubectl get service nginx-service # Notice the NodePort --> 30008
```

## update deployment and service

```bash
# edit deploymeent details
kubectl edit deployment nginx-deployment
kubectl edit service nginx-service
```

OR EXPORT YAML, EDIT, AND APPLY

```bash
kubectl get deployment nginx-deployment -o yaml > nginx-deployment.yaml
kubectl get service nginx-service -o yaml > nginx-service.yaml

# edit the yaml files
kubectl apply -f nginx-deployment.yaml
kubectl apply -f nginx-service.yaml
```

OR EDIT DIRECTLY USING COMMANDS

```bash
kubectl set image deployment/nginx-deployment nginx=nginx:latest
kubectl scale deployment nginx-deployment --replicas=5
kubectl patch service nginx-service -p '{"spec":{"nodePort":32165}}'
```

## verify
```bash
kubectl get deployment nginx-deployment # Notice the Ready column --> 5/5
kubectl get service nginx-service # Notice the NodePort --> 32165
```