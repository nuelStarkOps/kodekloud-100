# Creating an Azure Managed Disk

Create a managed disk with the following requirements:

- Name of the disk should be datacenter-disk.

- Disk type must be Standard_LRS.

- Disk size must be 2 GiB.


```bash
# get resource group name
az group list -o table
```

***--> kml_rg_main-c58ee97a9e4346c2***

```bash
# create managed disk
az disk create --resource-group kml_rg_main-c58ee97a9e4346c2 --name datacenter-disk --sku Standard_LRS --size 2

# confnirm disk
az disk list --resource-group kml_rg_main-c58ee97a9e4346c2 -o table
```
