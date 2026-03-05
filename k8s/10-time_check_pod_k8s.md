The Sample DevOps team needs a time check pod created in a specific Kubernetes namespace for logging purposes. Initially, it's for testing, but it may be integrated into an existing cluster later. Here's what's required:

- Create a pod called time-check in the namespace-name namespace. The pod should contain a container named time-check, utilizing the busybox image with the latest tag (specify as busybox:latest).

- Create a config map named time-config with the data TIME_FREQ=10 in the same namespace.

- Configure the time-check container to execute the command: while true; do date; sleep $TIME_FREQ;done. Ensure the result is written /opt/devops/time/time-check.log. Also, add an environmental variable TIME_FREQ in the container, fetching its value from the config map TIME_FREQ key.

- Create a volume log-volume and mount it at /opt/devops/time within the container.

---

1. create the namespace-name namespace
```bash
kubectl create namespace namespace-name
```

2. create config map
```bash
kubectl create configmap time-config --from-literal=TIME_FREQ=10 -n namespace-name

# verify config map
kubectl get configmap time-config -n namespace-name
```

3. create pod
---
Write the [yaml file](./10-time_check_k8s.yaml)

---

```bash
# apply k8s file
kubectl apply -f 10-time_check_k8s.yaml

kubectl get pods -n namespace-name
```

4. verify the command is executed in the pod

```bash
# exec into the pod
kubectl exec -it time-check -n namespace-name -- /bin/sh

# check the log file
cat /opt/devops/time/time-check.log 
```
a timestamp for every 10 seconds should be printed out

---

## Real World Use Case(s)

Here’s the simple version — no fluff.

What you built is basically:

> A small program that runs repeatedly inside Kubernetes, uses configurable settings, and writes output to storage.

That pattern is extremely common.

---

### 🔹 1. Periodic Status Checks

Instead of printing `date`, it could:

* Check if an internal API is alive
* Verify database connectivity
* Ping another service

Used for:

* Internal health monitoring
* Debugging unstable systems

---

### 🔹 2. Background Workers

Many systems need something running constantly in the background.

Examples:

* Checking a message queue for new tasks
* Processing uploaded files
* Refreshing cached data

Your loop structure is the foundation of background workers.

---

### 🔹 3. Polling Services

Some systems don’t get events automatically.
They must check for updates repeatedly.

Examples:

* Polling an external API
* Checking for config updates
* Watching for file changes

That `while true; sleep X` pattern is classic polling.

---

### 🔹 4. Logging & Debugging

Sometimes teams deploy temporary pods just to:

* Capture logs
* Monitor network activity
* Track timestamps or events

Your pod is essentially a simple log generator with mounted storage.

---

### 🔹 5. Configurable Runtime Behavior

Using a ConfigMap means:

* You can change the interval (10 seconds → 30 seconds)
* Without rebuilding the image
* Without rewriting code

That’s how real production systems manage runtime settings.

---

### In One Sentence

This setup represents the core pattern behind:

* Monitoring agents
* Background workers
* Polling services
* Internal debugging tools

The example is simple.
The architectural pattern is foundational in real distributed systems.

If you're aiming to design scalable systems, understanding this pattern is not optional — it’s basic infrastructure thinking.
