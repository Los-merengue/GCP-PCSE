#!/bin/bash

## Task 1

echo "Welcome to this Lab of Implementing Security Fundamentals in GCP, I am an automation script"

echo "===========================WELCOME================================"

echo "Now that you are here, I will need to ask you for some values to input to enable me proceed"

echo "What is the Zone you want to Deploy this Infrastructure"
read ZONE

echo "What is the name of the custom role you want to deploy"
read CUSTOM_SECURITY_ROLE

echo "What is the name of the Service Account"
read SERVICE_ACCOUNT

echo "What is the name of the Cluster Name"
read CLUSTER_NAME

export ZONE=$ZONE
export CUSTOM_SECURITY_ROLE=$CUSTOM_SECURITY_ROLE
export SERVICE_ACCOUNT=$SERVICE_ACCOUNT
export CLUSTER_NAME=$CLUSTER_NAME

gcloud config set compute/zone $ZONE

cat > define-role.yaml <<EOF_END
title: "$CUSTOM_SECURITY_ROLE"
description: "This role script is used to give the permissions"
stage: "ALPHA"
includedPermissions:
- storage.buckets.get
- storage.objects.get
- storage.objects.list
- storage.objects.update
- storage.objects.create
EOF_END

gcloud iam service-accounts create orca-private-cluster-sa --display-name "Service Account of Orca Private Cluster"
gcloud iam roles create $CUSTOM_SECURITY_ROLE --project $DEVSHELL_PROJECT_ID --file define-role.yaml

## Task 2

gcloud iam service-accounts create $SERVICE_ACCOUNT --display-name "Service Account of Orca Private Cluster"

## Task 3 
gcloud projects add-iam-policy-binding $DEVSHELL_PROJECT_ID --member serviceAccount:$SERVICE_ACCOUNT@$DEVSHELL_PROJECT_ID.iam.gserviceaccount.com \
--role roles/monitoring.metricWriter

gcloud projects add-iam-policy-binding $DEVSHELL_PROJECT_ID --member serviceAccount:$SERVICE_ACCOUNT@$DEVSHELL_PROJECT_ID.iam.gserviceaccount.com \
--role roles/monitoring.viewer

gcloud projects add-iam-policy-binding $DEVSHELL_PROJECT_ID --member serviceAccount:$SERVICE_ACCOUNT@$DEVSHELL_PROJECT_ID.iam.gserviceaccount.com \
--role roles/logging.logWriter

gcloud projects add-iam-policy-binding $DEVSHELL_PROJECT_ID --member serviceAccount:$SERVICE_ACCOUNT@$DEVSHELL_PROJECT_ID.iam.gserviceaccount.com \
--role projects/$DEVSHELL_PROJECT_ID/roles/$CUSTOM_SECURITY_ROLE

## Task 4

gcloud container clusters create $CLUSTER_NAME --num-nodes 1 --master-ipv4-cidr=172.16.0.64/28 --network orca-build-vpc --subnetwork orca-build-subnet \
--enable-master-authorized-networks --master-authorized-networks 192.168.10.2/32 --enable-ip-alias --enable-private-nodes --enable-private-endpoint \ 
--service-account $SERVICE_ACCOUNT@$DEVSHELL_PROJECT_ID.iam.gserviceaccount.com --zone $ZONE

## Task 5:

gcloud compute ssh --zone "$ZONE" "orca-jumphost" --project "$DEVSHELL_PROJECT_ID" --quiet --command "gcloud config set compute/zone $ZONE && \ 
gcloud container clusters get-credentials $CLUSTER_NAME --internal-ip && sudo apt-get install google-cloud-sdk-gke-gcloud-auth-plugin \
&& kubectl create deployment hello-server --image=gcr.io/google-samples/hello-app:1.0 && kubectl expose deployment hello-server \
--name orca-hello-service --type LoadBalancer --port 80 --target-port 8080"

echo "===================================END==========================================="