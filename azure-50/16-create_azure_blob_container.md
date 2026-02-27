# Creating an Azure Blob Container

## what's an azure blob container?

An Azure Blob Storage container is a logical grouping of blobs (objects) within a storage account. It's like a folder in a file system that holds your files (blobs). You can create containers to organize your data and control access to it.

## get the resource group name

```bash
az group list --output table
```

--> kml_rg_main-90bbacf98e2148e8


## create a storage account

```bash
az storage account create --name devopsst13835 --resource-group kml_rg_main-90bbacf98e2148e8 --location eastus --sku <sku>
```

## create a private blob container

```bash

# create a private blob container
az storage container create --name devops-container --account-name devopsst13835 --public-access off

#verify the container
az storage container list --account-name devopsst13835 --output table
```
