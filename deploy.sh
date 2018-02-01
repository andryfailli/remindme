#!/usr/bin/env bash

kubectl create -f ./remindme-db-deployment.yaml
kubectl create -f ./remindme-db-service.yaml
kubectl create -f ./remindme-api-deployment.yaml
kubectl create -f ./remindme-api-service.yaml
kubectl create -f ./remindme-api-autoscaler.yaml
kubectl create -f ./remindme-notifier-deployment.yaml
kubectl create -f ./remindme-notifier-service.yaml
kubectl create -f ./remindme-notifier-autoscaler.yaml
kubectl create -f ./remindme-notifier-cron.yaml
kubectl create -f ./remindme-frontend-deployment.yaml
kubectl create -f ./remindme-frontend-service.yaml
kubectl create -f ./remindme-frontend-autoscaler.yaml
sed -i "s/<public-cert-pem-file-base64-encoded>/$REMINDME_SECRET_CRT/g" ./remindme-secret.yaml
sed -i "s/<private-key-file-base64-encoded>/$REMINDME_SECRET_KEY/g" ./remindme-secret.yaml
kubectl create -f ./remindme-secret.yaml
kubectl create -f ./remindme-ingress.yaml