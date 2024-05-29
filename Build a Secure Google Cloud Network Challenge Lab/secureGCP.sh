#!/bin/bash

echo -e "Welcome to this Build and Secure Networks in Google Cloud Challenge Lab\n"

echo "===========================WELCOME================================"

echo -e "\n\n Now that you are here, I will need to ask you for some values to input to enable me proceed \n"

echo -e "\n\nWhat is the Zone you plan to work on"
read ZONE

echo -e "\n\nWhat is the IAP_NETWORK_TAG"
read IAP_NETWORK_TAG

echo -e "\n\nWhat is the INTERNAL NETWORK TAG"
read INTERNAL NETWORK TAG

echo -e "\n\nWhat is the name of the HTTP_NETWORK TAG"
read HTTP_NETWORK TAG


export IAP_NETWORK_TAG=$IAP_NETWORK_TAG

export INTERNAL_NETWORK_TAG=$INTERNAL NETWORK TAG

export HTTP_NETWORK_TAG=$HTTP_NETWORK TAG

export ZONE=$ZONE


gcloud compute firewall-rules delete open-access
 

gcloud compute firewall-rules create ssh-ingress --allow=tcp:22 --source-ranges 35.235.240.0/20 --target-tags $IAP_NETWORK_TAG --network acme-vpc
 
gcloud compute instances add-tags bastion --tags=$IAP_NETWORK_TAG --zone=$ZONE
 

gcloud compute firewall-rules create http-ingress --allow=tcp:80 --source-ranges 0.0.0.0/0 --target-tags $HTTP_NETWORK_TAG --network acme-vpc
 
gcloud compute instances add-tags juice-shop --tags=$HTTP_NETWORK_TAG --zone=$ZONE
 

gcloud compute firewall-rules create internal-ssh-ingress --allow=tcp:22 --source-ranges 192.168.10.0/24 --target-tags $INTERNAL_NETWORK_TAG --network acme-vpc
 
gcloud compute instances add-tags juice-shop --tags=$INTERNAL_NETWORK_TAG --zone=$ZONE
 


#Task 6 : SSH to bastion host via IAP and juice-shop via bastion
#In Compute Engine -> VM Instances page, click the SSH button for the bastion host. Then SSH to juice-shop by
 
gcloud compute ssh juice-shop --internal-ip