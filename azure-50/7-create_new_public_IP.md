**allocate a Public IP address, name it as datacenter-pip**

```bash
# get resource group name
az group list --output table

# --> kml_rg_main-c9af757c73c445da  eastus      Succeeded

# get vm name if any
az 

# create the public ip
az network public-ip create \
  --resource-group kml_rg_main-c9af757c73c445da \
  --name datacenter-pip \
  --sku Standard \
  --allocation-method Static
```