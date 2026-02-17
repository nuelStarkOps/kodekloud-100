**Execute a rolling update for this application, integrating the nginx:1.17 image. The deployment is named nginx-deployment. Ensure all pods are operational post-update.**

```bash
# verify deployment
kubectl get deployment nginx-deployment

# verify pods
kubectl get pods

## update directly
# update the deployment
kubectl set image deployment/nginx-deployment nginx=nginx:1.17

## update using yaml file
# export the deployment config to a yaml file
kubectl get deployment nginx-deployment -o yaml > nginx-deployment.yaml

# edit the yaml file
# update the image
# save the file

# apply the changes
kubectl apply -f nginx-deployment.yaml

# view rth epods terminating and creating 
kubectl get pods

# verify change
kubectl describe deployment nginx-deployment
```
