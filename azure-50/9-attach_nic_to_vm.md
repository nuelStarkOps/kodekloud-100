**An existing VM named vm-name and a network interface named nic-name already exist in the southcentralus region.**

- Attach the network interface nic-name to the VM vm-name.
- Ensure the NIC's status is attached before submitting the task

```bash
# deallocate VM - Azure doesn't allow NIC attachments on running VMs viathe CLI

az vm deallocate --resource-group resource-group-name --name vm-name

# allocate NIC to VM
az vm nic add --resource-group resource-group-name --vm-name vm-name --nics nic-name

# start VM
az vm start --resource-group resource-group-name --name vm-name
```