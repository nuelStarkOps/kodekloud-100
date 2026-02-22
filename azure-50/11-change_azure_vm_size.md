1) Change the VM size from Standard_B1s to Standard_B2s for the virtual machine named devops-vm.

2) Ensure the VM is in the running state after the size change is complete.


```bash
# get resource group
az group list -o table

## --> kml_rg_main-01880ecd265c4ea6

# confirm vm 
az vm list -g kml_rg_main-01880ecd265c4ea6 -o table

## --> devops-vm

# resize to Standard_B2s
az vm resize --resource-group kml_rg_main-01880ecd265c4ea6 --name devops-vm --size Standard_B2s

# confirm vm is running
az vm show --resource-group kml_rg_main-01880ecd265c4ea6 --name devops-vm --query "powerState" --output tsv
```
