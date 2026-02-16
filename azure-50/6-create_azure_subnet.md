**task - For this task, create a Virtual Network (VNet) named devops-vnet and one subnet named devops-subnet within the VNet in the centralus region. Make sure the IPv4 address range is 10.0.0.0/16.**

```bash
# verify resource group
az group list --output table

--> 
kml_rg_main-f94cf32f67694720

# create the virtual network
az network vnet create --name devops-vnet --resource-group kml_rg_main-f94cf32f67694720 --address-prefix 10.0.0.0/16 --location centralus

# create a subnet within the VNet
az network vnet subnet create --name devops-subnet --resource-group kml_rg_main-f94cf32f67694720 --vnet-name devops-vnet --address-prefix 10.0.0.0/24

# verify the VNet and subnet
az network vnet show --name devops-vnet --resource-group kml_rg_main-f94cf32f67694720 --output table
```