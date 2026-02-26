# Creating a ReplicationController in K8S

The Nautilus DevOps team is establishing a ReplicationController to deploy multiple pods for hosting applications that require a highly available infrastructure. Follow the specifications below to create the ReplicationController:


Create a ReplicationController using the nginx image with latest tag, and name it nginx-replicationcontroller.

Assign labels app as nginx_app, and type as front-end. Ensure the container is named nginx-container and set the replica count to 3.


All pods should be running state post-deployment.

## create the replication controlleryaml file

```bash
vi nginx-replicationcontroller.yaml
```

find the [yaml file here](./13-nginx-replicationcontroller.yaml)


## apply the replication controller

```bash
kubectl apply -f nginx-replicationcontroller.yaml
```


## verify the replication controller

```bash
kubectl get rc
```



## Real Life Use Cases

A ReplicationController (RC) ensures a specified number of pod replicas run at all times. It automatically replaces failed pods, maintaining availability.

### Key Real-World Uses:
**Web Server Pools** – Keep multiple stateless web pods running for **high availability**

**Background Workers** – Maintain a set number of worker pods processing queues or jobs.

**Stateless Microservices** – Ensure critical microservices remain running across nodes.

**Node Failure Recovery** – Auto-reschedule pods if nodes go down.

**Scaling Workloads** – Adjust the number of replicas to handle load.

**Legacy or Simple Deployments** – Maintain pod replication without advanced rollout features.

***Note***: Modern Kubernetes uses ReplicaSets and Deployments, but the principle of guaranteed pod availability remains the same.