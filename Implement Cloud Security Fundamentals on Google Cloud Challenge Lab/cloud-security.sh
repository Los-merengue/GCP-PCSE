#!/bin/bash

## Task 1

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

## Task 

gcloud container clusters create $CLUSTER_NAME --num-nodes 1 --master-ipv4-cidr=172.16.0.64/28 --network orca-build-vpc --subnetwork orca-build-subnet \
--enable-master-authorized-networks --master-authorized-networks 192.168.10.2/32 --enable-ip-alias --enable-private-nodes --enable-private-endpoint \ 
--service-account $SERVICE_ACCOUNT@$DEVSHELL_PROJECT_ID.iam.gserviceaccount.com --zone $ZONE
