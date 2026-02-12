**task - deploy a pod named pod-nginx in the cluster using the nginx:latest tag. specify the name of the container as nginx-container and app label to be nginx-app**

```yaml
apiVersion: v1
kind: Pod
metadata:
  name: pod-nginx
  labels:
    app: nginx-app
spec:
  containers:
  - name: nginx-container
    image: nginx:latest
```

```bash
#create the pod
kubectl apply -f nginx.yaml

#verify pod creation
kubectl get pods

#verify pod labels
kubectl get pods --show-labels

#verify pod description
kubectl describe pod pod-nginx

#delete the pod
kubectl delete pod pod-nginx
```
