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