**Create a ReplicaSet using nginx image with latest tag (ensure to specify as nginx:latest) and name it nginx-replicaset.**

- Apply labels: app as nginx_app, type as front-end.


- Name the container nginx-container. Ensure the replica count is 4.


[yaml file](./7-replica_set.yaml)

```bash
#create the replicaset
kubectl apply -f 7-replica_set.yaml

#verify the replicaset
kubectl get rs

#get more info about the replicaset
kubectl describe rs nginx-replicaset

#cleanup
kubectl delete rs nginx-replicaset
```