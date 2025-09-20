#!/bin/bash
set -e

echo "Deploying Brain Tasks App to EKS..."

kubectl apply -f k8s/deployment.yaml
kubectl apply -f k8s/service.yaml
kubectl apply -f k8s/hpa.yaml

echo "Deployment successful!"
