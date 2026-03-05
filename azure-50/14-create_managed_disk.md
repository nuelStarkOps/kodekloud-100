# Creating an Azure Managed Disk

Create a managed disk with the following requirements:

- Name of the disk should be disk-name.

- Disk type must be Standard_LRS.

- Disk size must be 2 GiB.


```bash
# get resource group name
az group list -o table
```

***--> resource-group-name***

```bash
# create managed disk
az disk create --resource-group resource-group-name --name disk-name --sku Standard_LRS --size 2

# confnirm disk
az disk list --resource-group resource-group-name -o table
```
