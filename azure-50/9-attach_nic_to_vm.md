**An existing VM named xfusion-vm and a network interface named xfusion-nic already exist in the southcentralus region.**

- Attach the network interface xfusion-nic to the VM xfusion-vm.
- Ensure the NIC's status is attached before submitting the task

```bash
# deallocate VM - Azure doesn't allow NIC attachments on running VMs viathe CLI

az vm deallocate --resource-group kml_rg_main-321e2cb783754f38 --name xfusion-vm

# allocate NIC to VM
az vm nic add --resource-group kml_rg_main-321e2cb783754f38 --vm-name xfusion-vm --nics xfusion-nic

# start VM
az vm start --resource-group kml_rg_main-321e2cb783754f38 --name xfusion-vm
```