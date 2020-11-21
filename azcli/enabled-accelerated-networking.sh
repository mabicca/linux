#!/bin/bash
az network nic update --accelerated-networking true --name $1 --resource-group $2
