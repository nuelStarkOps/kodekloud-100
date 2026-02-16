**task - create a deployment named nginx-deployment in the default namespace using the nginx:latest image. set the CPU limit to 200m and memory limit to 256Mi. set the CPU request to 100m and memory request to 128Mi**

```yaml
apiVersion: v1
kind: Pod
metadata:
  name: httpd-pod
spec:
  containers:
  - name: httpd-container
    image: httpd:latest
    ports:
    - containerPort: 80
    resources:
       requests:
         memory: "15Mi"
         cpu: "100m"
       limits:
         memory: "20Mi"
         cpu: "100m"
```

```bash
#create the deployment
kubectl apply -f httpd.yaml

#verify the deployment
kubectl get pods

#get more info about the deployment
kubectl describe pod httpd-pod

#cleanup
kubectl delete pod httpd-pod
```