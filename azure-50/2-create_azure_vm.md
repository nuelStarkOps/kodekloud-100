**task - create an Azure Virtual Machine. make sure you can gain ssh access to it**

*** ubuntu 22.04 LTS, 30GB Standard HDD, ssh access from anywhere ***

login to azure portal and create a virtual machine named "datacenter-vm" in the centralus region. use the following specifications:

- image: ubuntu 22.04 LTS
- size: standard_B1s
- authentication type: ssh public key
- ssh public key: paste the contents of the "x-fusion.pem" file
- networking: create a new virtual network and subnet
- public ip: create a new public ip
- security group: create a new security group with the following inbound rules:
  - ssh (tcp/22) from anywhere (0.0.0.0/0)
  - http (tcp/80) from anywhere (0.0.0.0/0)
  - https (tcp/443) from anywhere (0.0.0.0/0)

```bash
# test ssh access
chmod 400 datacenter-vm.pem
ssh -i datacenter-vm.pem azureuser@<publicipaddress>
```

<!-- OR using CLI . . .

```bash
#create the virtual machine
az vm create --name x-fusion --resource-group x-fusion --image ubuntu-2204 --size standard_b2s --admin-username azureuser --ssh-key-value @x-fusion.pem --public-ip-sku Standard --public-ip-address "x-fusion-ip" --vnet-name x-fusion-vnet --subnet x-fusion-subnet --security-group x-fusion-sg

#verify the virtual machine was created
az vm show --name x-fusion --resource-group x-fusion

#delete the virtual machine
az vm delete --name x-fusion --resource-group x-fusion
``` -->