Add the tag Environment=dev to the virtual machine named xfusion-vm.


***get the resource group and vm name***
```bash
az group list -o table
# --> kml_rg_main-ae5c8d8bcc144b4e

az vm list -o table
```

***add tag***
```bash
az vm update --resource-group kml_rg_main-ae5c8d8bcc144b4e --name xfusion-vm --set tags.Environment=dev
```

***verify tag***
```bash
az vm show --resource-group kml_rg_main-ae5c8d8bcc144b4e --name xfusion-vm --query "tags" --output table
```