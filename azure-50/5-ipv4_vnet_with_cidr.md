**Create a Virtual Network (VNet) named vnet-name in the eastus region with 192.168.0.0/24 IPv4 CIDR.**

```bash
# create the resource group
az group create --name <resource-group> --location eastus

# get resource group if it exists
az group list --output table

--> resource-group-name

# create the virtual network
az network vnet create --name vnet-name --resource-group resource-group-name --address-prefix 192.168.0.0/24 --location eastus

# verify the virtual network
az network vnet show --name vnet-name --resource-group resource-group-name --output table
```