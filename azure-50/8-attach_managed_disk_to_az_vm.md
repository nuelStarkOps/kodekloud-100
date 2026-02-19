**An existing VM named datacenter-vm and a managed disk named datacenter-disk already exist in the centralus region.**

- Attach the disk datacenter-disk to the VM datacenter-vm as a data disk.
Ensure the disk is attached to the VM datacenter-vm.

- Make sure that the virtual machine initialization has been completed before submitting this task.


```bash
# get the resource group
az group list -o table

--> kml_rg_main-e7196ffdc65f484d

# confirm vm name
az vm list -o table

--> datacenter-vm

# confirm disk name
az disk list -o table

--> datacenter-disk

# attach disk to vm
az vm disk attach --resource-group kml_rg_main-e7196ffdc65f484d --vm-name devops-vm --name devops-disk
```

