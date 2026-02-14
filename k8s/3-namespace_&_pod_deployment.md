**task - create a namespace named dev and deploy a pod named dev-nginx-pod in the dev namespace using the nginx:latest tag. specify the name of the container as nginx and app label to be nginx-app**



```yaml
apiVersion: v1
kind: Pod
metadata:
  name: dev-nginx-pod
spec:
  containers:
  - name: nginx
    image: nginx:latest
    ports:
    - containerPort: 80
```

```bash
#create the namespace
kubectl create namespace dev

#create the pod
kubectl apply -f nginx.yaml -n dev

#verify pod creation
kubectl get pods -n dev

#verify pod labels
kubectl get pods --show-labels -n dev

#verify pod description
kubectl describe pod dev-nginx-pod

#clennup

#delete the pod
kubectl delete pod dev-nginx-pod

#delete the namespace
kubectl delete namespace dev
```