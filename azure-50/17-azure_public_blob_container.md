# Creating an Azure Public Blob Container

Create a new storage account named <storage_account_name> and a public Blob container named <blob_name> within the storage account. Make sure anonymous read access for containers and blobs is enabled.

## create the storage account

```bash
az storage account create --name <storage_account_name> --resource-group <resource_group_name> --sku Standard_LRS --kind StorageV2
```

## create a public blob container named blob-name within the storage account

```bash
az storage container create --name <blob_name> --account-name <storage_account_name> --public-access blob
```

## verify the container is public

```bash
az storage container show --name <blob_name> --account-name <storage_account_name> --query publicAccess
```
