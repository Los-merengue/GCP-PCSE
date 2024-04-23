#!/bin/bash

## Task 1

gcloud config set compute/zone $ZONE

cat > define-role.yaml <<EOF_END
title: "$CUSTOM_SECURITY_ROLE"
description: "This role script is used to give the permissions"
stage: "ALPHA"
includePermissions:
- storage.buckets.get
- storage.objects.get
- storage.objects.list
- storage.objects.update
- storage.objects.create
EOF_END

