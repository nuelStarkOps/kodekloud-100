**task - create a vnet named "vnet-namein westus region wioth any ipv4 CIDR Block**

- login to azure portal
- navigate to virtual networks
- click on create
- select the resource group
- select the region
- enter the vnet name
- enter the address prefix
- click on create

OR using azure cli

```bash
az network vnet create --name vnet-name --resource-group resource-group-name --address-prefixes 10.0
.0.0/16 --location westus
```