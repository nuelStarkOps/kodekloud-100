A junior DevOps team member encountered difficulties deploying a stack on the Kubernetes cluster. The pod fails to start, presenting errors. Let's troubleshoot and rectify the issue promptly.


There is a pod named webserver, and the container within it is named httpd-container, its utilizing the httpd:latest image.

Additionally, there's a sidecar container named sidecar-container using the ubuntu:latest image.

Identify and address the issue to ensure the pod is in the running state and the application is accessible.

***check pod status***
```bash
kubectl get pod webserver # not all pods are running --> 1/2

kubectl describe pod webserver # check events and conditions
```

--> Failed to pull image "httpd:latests": ... not found (main point of failure)

***fix***
```bash
kubectl set image pod/webserver httpd-container=httpd:latest
```
OR

```yaml
containers:
- name: httpd-container
  image: httpd:latest   # <-- fix here
  volumeMounts:
    - name: shared-logs
      mountPath: /var/log/httpd
```

then 

```bash
kubectl apply -f <filename>
```

***verify***
```bash
kubectl get pod webserver # should be running --> 2/2, an httpd will be ready to serve requests

# test HTTP
kubectl port-forward pod/webserver 8080:80
curl http://localhost:8080  # should work
```





