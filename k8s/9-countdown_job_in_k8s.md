- Create a job named countdown-nautilus.

- The spec template should be named countdown-nautilus (under metadata), and the container should be named container-countdown-nautilus

- Utilize image ubuntu with latest tag (ensure to specify as ubuntu:latest), and set the restart policy to Never.

- Execute the command sleep 5

```yaml
apiVersion: batch/v1
kind: Job
metadata:
  name: countdown-nautilus
spec:
  template:
    metadata:
      name: countdown-nautilus
    spec:
      restartPolicy: Never
      containers:
      - name: container-countdown-nautilus
        image: ubuntu:latest
        command:
        - sleep
        - "5"
```

```bash
# deploy job
kubectl apply -f countdown-nautilus.yaml

# verify job
kubectl get job countdown-nautilus

# watch pod
kubectl get pods -w
```

- after 5 seconds job will complete



