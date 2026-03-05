# Creating and Configuring NSG in Azure

For this task, create a network security group (NSG) with the following requirements:

Name of the NSG should be nsg-name.

Add an inbound security rule named Allow-HTTP for HTTP service on port 80, with the source CIDR range of 0.0.0.0/0.

Add another inbound security rule named Allow-SSH for SSH service on port 22, with the source CIDR range of 0.0.0.0/0.


## get the resource group name

```bash
az group list --output table
```

--> resource-group-name


## create the NSG

```bash
az network nsg create --name nsg-name --resource-group resource-group-name
```

![NSG Created](./15-create_nsg.png)


## add the inbound security rules

```bash
az network nsg rule create --name Allow-HTTP --nsg-name nsg-name --resource-group resource-group-name --priority 100 --access Allow --direction Inbound --protocol Tcp --source-port-range * --destination-port-range 80 --source-address-prefix * --destination-address-prefix *
```

![Allow-HTTP created](./15-allow-http.png)

```bash
az network nsg rule create --name Allow-SSH --nsg-name nsg-name --resource-group resource-group-name --priority 200 --access Allow --direction Inbound --protocol Tcp --source-port-range * --destination-port-range 22 --source-address-prefix * --destination-address-prefix *
```

![Allow-SSH created](./15-allow-ssh.png)