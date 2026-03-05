- Create a job named countdown-job-name.

- The spec template should be named countdown-job-name (under metadata), and the container should be named container-countdown-job-name

- Utilize image ubuntu with latest tag (ensure to specify as ubuntu:latest), and set the restart policy to Never.

- Execute the command sleep 5


[yaml file](./9-countdown_nautilus.yaml)


```bash
# deploy job
kubectl apply -f countdown-job-name.yaml

# verify job
kubectl get job countdown-job-name

# watch pod
kubectl get pods -w
```

- after 5 seconds job will complete



