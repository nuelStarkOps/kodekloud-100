**Create a new Azure Virtual Machine named devops-vm using the Azure CLI**

*** - Use the Ubuntu2204 image and set the VM size to Standard_B2s ***

*** - Make sure the admin username is set to azureuser and SSH keys are generated for secure access.***

*** - Use Standard_LRS storage account, disk size must be 30GB and ensure the VM devops-vm is in the running state after creation.***

```bash
# get resource group value
az group list --output table

# create vm using az vm create
az vm create \
  --resource-group kml_rg_main-7007a58a5af54a70 \
  --name devops-vm \
  --image Ubuntu2204 \
  --size Standard_B2s \
  --admin-username azureuser \
  --generate-ssh-keys \
  --storage-sku Standard_LRS \
  --os-disk-size-gb 30

# verify vm is running
az vm get-instance-view \
  --resource-group kml_rg_main-7007a58a5af54a70 \
  --name devops-vm \
  --query "instanceView.statuses[?starts_with(code, 'PowerState/')].displayStatus" \
  -o table

#ssh into the vm
az vm show -d \
  --resource-group kml_rg_main-7007a58a5af54a70 \
  --name devops-vm \
  --query publicIps \
  -o tsv

#ssh into the vm
ssh azureuser@<publicipaddress>

# delete the vm
az vm delete \
  --resource-group kml_rg_main-7007a58a5af54a70 \
  --name devops-vm \
  --yes \
  --no-wait
```

