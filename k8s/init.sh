#!/bin/bash

BASEDIR=$(dirname "$0")

# Create GCE disk
gcloud compute disks create dtapi-mysql --zone=europe-north1-a --size=10

# Reserve static IP
kubectl apply -f "$BASEDIR/gcp/compute-address.yaml"
kubectl apply -k "$BASEDIR"
