**task - For this task, create a Virtual Network (VNet) named vnet-name and one subnet named subnet-name within the VNet in the centralus region. Make sure the IPv4 address range is 10.0.0.0/16.**

```bash
# verify resource group
az group list --output table

--> 
resource-group-name

# create the virtual network
az network vnet create --name vnet-name --resource-group resource-group-name --address-prefix 10.0.0.0/16 --location centralus

# create a subnet within the VNet
az network vnet subnet create --name subnet-name --resource-group resource-group-name --vnet-name vnet-name --address-prefix 10.0.0.0/24

# verify the VNet and subnet
az network vnet show --name vnet-name --resource-group resource-group-name --output table
```