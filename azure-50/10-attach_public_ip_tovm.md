- An existing VM named nautilus-vm-pip and a public IP address named nautilus-pip already exist.

- Attach the public IP nautilus-pip to the network interface of the VM nautilus-vm-pip.
Make sure the VM is properly assigned the public IP.

```bash

# get resource group
az group list --output table
# --> kml_rg_main-a805a145b1a94836

# check if vm and public ip exist
az vm list -o table
# --> nautilus-vm-pip <--
az network public-ip list -o table
# --> nautilus-pip <--

# get network interface of the vm
az vm show --name nautilus-vm-pip --resource-group kml_rg_main-a805
a145b1a94836 --query "networkProfile.networkInterfaces[].id" -o tsv
# --> nautilus-vm-pipVMNic


# ipconfig1 is usually the default IP configuration name. verify with
az network nic show \
  --name nautilus-vm-pipVMNic \
  --resource-group kml_rg_main-a805a145b1a94836 \
  --query "ipConfigurations[].name"

# --> ipconfignautilus-vm-pip <--


# attach public ip to nic
az network nic ip-config update \
  --resource-group kml_rg_main-a805a145b1a94836 \
  --nic-name nautilus-vm-pipVMNic \
  --name ipconfignautilus-vm-pip \
  --public-ip-address nautilus-pip

# verify the public ip is attached to the vm
az network public-ip show \
  --name nautilus-pip \
  --resource-group kml_rg_main-a805a145b1a94836 \
  --query "{IP:ipAddress, AssignedTo:ipConfiguration.id}" \
  -o table



