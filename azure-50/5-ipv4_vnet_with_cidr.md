**Create a Virtual Network (VNet) named datacenter-vnet in the eastus region with 192.168.0.0/24 IPv4 CIDR.**

```bash
# create the resource group
az group create --name <resource-group> --location eastus

# get resource group if it exists
az group list --output table

--> kml_rg_main-c53e43a5beec4017

# create the virtual network
az network vnet create --name datacenter-vnet --resource-group kml_rg_main-c53e43a5beec4017 --address-prefix 192.168.0.0/24 --location eastus

# verify the virtual network
az network vnet show --name datacenter-vnet --resource-group kml_rg_main-c53e43a5beec4017 --output table
```