**task - create an Azure Virtual Machine. make sure you can gain ssh access to it**

*** ubuntu 22.04 LTS, 30GB Standard HDD, ssh access from anywhere ***

login to azure portal and create a virtual machine named "vm-name" in the centralus region. use the following specifications:

- image: ubuntu 22.04 LTS
- size: standard_B1s
- authentication type: ssh public key
- ssh public key: paste the contents of the "keypair-name.pem" file
- networking: create a new virtual network and subnet
- public ip: create a new public ip
- security group: create a new security group with the following inbound rules:
  - ssh (tcp/22) from anywhere (0.0.0.0/0)
  - http (tcp/80) from anywhere (0.0.0.0/0)
  - https (tcp/443) from anywhere (0.0.0.0/0)

```bash
# test ssh access
chmod 400 vm-name.pem
ssh -i vm-name.pem azureuser@<publicipaddress>
```

<!-- OR using CLI . . .

```bash
#create the virtual machine
az vm create --name keypair-name --resource-group keypair-name --image ubuntu-2204 --size standard_b2s --admin-username azureuser --ssh-key-value @keypair-name.pem --public-ip-sku Standard --public-ip-address "keypair-name-ip" --vnet-name keypair-name-vnet --subnet keypair-name-subnet --security-group keypair-name-sg

#verify the virtual machine was created
az vm show --name keypair-name --resource-group keypair-name

#delete the virtual machine
az vm delete --name keypair-name --resource-group keypair-name
``` -->