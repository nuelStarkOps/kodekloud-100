**An existing VM named vm-name and a managed disk named disk-name already exist in the centralus region.**

- Attach the disk disk-name to the VM vm-name as a data disk.
Ensure the disk is attached to the VM vm-name.

- Make sure that the virtual machine initialization has been completed before submitting this task.


```bash
# get the resource group
az group list -o table

--> resource-group-name

# confirm vm name
az vm list -o table

--> vm-name

# confirm disk name
az disk list -o table

--> disk-name

# attach disk to vm
az vm disk attach --resource-group resource-group-name --vm-name vm-name --name disk-name
```

