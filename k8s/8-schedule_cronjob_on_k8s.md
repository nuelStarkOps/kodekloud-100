To kickstart the process, they're creating cron jobs in the Kubernetes cluster with placeholder commands. Follow the instructions below:

- Create a cronjob named nautilus.

- Set Its schedule to something like */7 * * * *. You can set any schedule for now.

- Name the container cron-nautilus.

- Utilize the httpd image with latest tag (specify as httpd:latest).

- Execute the dummy command echo Welcome to xfusioncorp!.

- Ensure the restart policy is OnFailure.

---


***write the yaml file for the cronjob***

[yaml file](./8-schedule_cronjob.yaml)


```bash
#create the cronjob
kubectl apply -f 8-schedule_cronjob.yaml

#verify the cronjob
kubectl get cronjob

#get more info about the cronjob
kubectl describe cronjob nautilus

#cleanup
kubectl delete cronjob nautilus
```