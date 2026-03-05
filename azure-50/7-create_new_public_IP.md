**allocate a Public IP address, name it as pip-name**

```bash
# get resource group name
az group list --output table

# --> resource-group-name  eastus      Succeeded

# get vm name if any
az 

# create the public ip
az network public-ip create \
  --resource-group resource-group-name \
  --name pip-name \
  --sku Standard \
  --allocation-method Static
```