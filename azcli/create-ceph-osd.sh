#Provide the subscription Id of the subscription where you want to create Managed Disks
subscriptionId=43c695ef-5c50-45c1-b4a1-ccfd58568592

#Provide the name of your resource group
resourceGroupName=CEPH

#Provide the Availability set
avset=ceph-osd

#Provide the name of the snapshot that will be used to create Managed Disks
snapshotName=ceph-mon-image

#Provide osDisk name
diskname=2-osdisk

#Provide the name of the Managed Disk
osDiskName=ceph-osd-$diskname

#Provide the size of the disks in GB. It should be greater than the VHD file size.
diskSize=40

#Provide the storage type for Managed Disk. Premium_LRS or Standard_LRS.
storageType=Premium_LRS

#Provide the OS type
osType=linux

#Provide the name of the virtual machine
virtualMachineName=ceph-osd-2

#Set the context to the subscription Id where Managed Disk will be created
az account set --subscription $subscriptionId

#Get the snapshot Id 
snapshotId=$(az snapshot show --name $snapshotName --resource-group $resourceGroupName --query [id] -o tsv)

#Create a new Managed Disks using the snapshot Id
az disk create --resource-group $resourceGroupName --name $osDiskName --sku $storageType --size-gb $diskSize --source $snapshotId 

#Create VM by attaching created managed disks as OS
az vm create --name $virtualMachineName --resource-group $resourceGroupName --availability-set $avset --attach-os-disk $osDiskName --os-type $osType
