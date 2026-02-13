**task - create an app deployment "nginx" in Kubernetes using the latest tag for the nginx image**

```bash
#create nginx deployment
kubectl create deployment nginx --image=nginx:latest

# verify deployment
kubectl get deployments

# get more info about the deployment
kubectl describe deployment nginx
```
