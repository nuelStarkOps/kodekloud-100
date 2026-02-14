**task - create a vnet named "xfusion-vnetin westus region wioth any ipv4 CIDR Block**

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
az network vnet create --name xfusion-vnet --resource-group kml_rg_main-e02c4d456ff242c6 --address-prefixes 10.0
.0.0/16 --location westus
```