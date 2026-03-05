Add the tag Environment=dev to the virtual machine named vm-name.


***get the resource group and vm name***
```bash
az group list -o table
# --> resource-group-name

az vm list -o table
```

***add tag***
```bash
az vm update --resource-group resource-group-name --name vm-name --set tags.Environment=dev
```

***verify tag***
```bash
az vm show --resource-group resource-group-name --name vm-name --query "tags" --output table
```