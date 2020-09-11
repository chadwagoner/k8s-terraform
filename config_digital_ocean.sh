#!/bin/bash

echo -e "Please enter DigitalOcean Token..."
read DO_TOKEN

cp ./terraform.tfvars.bck ./terraform.tfvars

sed -i -e "s/<DO_API_TOKEN>/$DO_TOKEN/g" ./terraform.tfvars