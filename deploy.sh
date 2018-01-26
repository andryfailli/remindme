#!/usr/bin/env bash

kubectl create -f ./remindme-db-deployment.yaml
kubectl create -f ./remindme-db-service.yaml
kubectl create -f ./remindme-api-deployment.yaml
kubectl create -f ./remindme-api-service.yaml
kubectl create -f ./remindme-notifier-deployment.yaml
kubectl create -f ./remindme-notifier-service.yaml
kubectl create -f ./remindme-notifier-autoscaler.yaml
kubectl create -f ./remindme-notifier-cron.yaml
kubectl create -f ./remindme-frontend-deployment.yaml
kubectl create -f ./remindme-frontend-service.yaml
kubectl create -f ./remindme-secret.yaml
kubectl create -f ./remindme-ingress.yaml