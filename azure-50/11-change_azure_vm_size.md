1) Change the VM size from Standard_B1s to Standard_B2s for the virtual machine named vm-name.

2) Ensure the VM is in the running state after the size change is complete.


```bash
# get resource group
az group list -o table

## --> resource-group-name

# confirm vm 
az vm list -g resource-group-name -o table

## --> vm-name

# resize to Standard_B2s
az vm resize --resource-group resource-group-name --name vm-name --size Standard_B2s

# confirm vm is running
az vm show --resource-group resource-group-name --name vm-name --query "powerState" --output tsv
```
