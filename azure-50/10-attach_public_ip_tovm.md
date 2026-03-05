- An existing VM named vm-name and a public IP address named pip-name already exist.

- Attach the public IP pip-name to the network interface of the VM vm-name.
Make sure the VM is properly assigned the public IP.

```bash

# get resource group
az group list --output table
# --> resource-group-name

# check if vm and public ip exist
az vm list -o table
# --> vm-name <--
az network public-ip list -o table
# --> pip-name <--

# get network interface of the vm
az vm show --name vm-name --resource-group resource-group-name --query "networkProfile.networkInterfaces[].id" -o tsv
# --> vm-nic-name


# ipconfig1 is usually the default IP configuration name. verify with
az network nic show \
  --name vm-nic-name \
  --resource-group resource-group-name \
  --query "ipConfigurations[].name"

# --> ipconfig-name <--


# attach public ip to nic
az network nic ip-config update \
  --resource-group resource-group-name \
  --nic-name vm-nic-name \
  --name ipconfig-name \
  --public-ip-address pip-name

# verify the public ip is attached to the vm
az network public-ip show \
  --name pip-name \
  --resource-group resource-group-name \
  --query "{IP:ipAddress, AssignedTo:ipConfiguration.id}" \
  -o table



