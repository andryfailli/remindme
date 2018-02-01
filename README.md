# RemindMe!
Collaborative reminders on a Kubernetes cluster

[![Build Status](https://travis-ci.org/andryfailli/remindme.svg?branch=master)](https://travis-ci.org/andryfailli/remindme)

## Modules

### [Frontend](https://github.com/andryfailli/remindme-frontend)
[![Build Status](https://travis-ci.org/andryfailli/remindme-frontend.svg?branch=master)](https://travis-ci.org/andryfailli/remindme-frontend)
[![Coverage Status](https://coveralls.io/repos/github/andryfailli/remindme-frontend/badge.svg?branch=master)](https://coveralls.io/github/andryfailli/remindme-frontend?branch=master)
[![Quality Gate](https://sonarcloud.io/api/badges/gate?key=it.andreafailli.remindme%3Aremindme-frontend)](https://sonarcloud.io/dashboard?id=it.andreafailli.remindme%3Aremindme-frontend)
[![SonarCloud Bugs](https://sonarcloud.io/api/badges/measure?key=it.andreafailli.remindme%3Aremindme-frontend&metric=bugs)](https://sonarcloud.io/component_measures/metric/reliability_rating/list?it.andreafailli.remindme%3Aremindme-frontend)
[![SonarCloud Vulnerabilities](https://sonarcloud.io/api/badges/measure?key=it.andreafailli.remindme%3Aremindme-frontend&metric=vulnerabilities)](https://sonarcloud.io/component_measures/metric/security_rating/list?id=it.andreafailli.remindme%3Aremindme-frontend)
[![SonarCloud Technical Debt](https://sonarcloud.io/api/badges/measure?key=it.andreafailli.remindme%3Aremindme-frontend&metric=sqale_index)](https://sonarcloud.io/component_measures/metric/sqale_index/list?id=it.andreafailli.remindme%3Aremindme-frontend)

### [Backend](https://github.com/andryfailli/remindme-backend)
[![Build Status](https://travis-ci.org/andryfailli/remindme-backend.svg?branch=master)](https://travis-ci.org/andryfailli/remindme-backend)
[![Coverage Status](https://coveralls.io/repos/github/andryfailli/remindme-backend/badge.svg?branch=master)](https://coveralls.io/github/andryfailli/remindme-backend?branch=master)
[![Quality Gate](https://sonarcloud.io/api/badges/gate?key=it.andreafailli.remindme%3Aremindme-backend)](https://sonarcloud.io/dashboard?id=it.andreafailli.remindme%3Aremindme-backend)
[![SonarCloud Bugs](https://sonarcloud.io/api/badges/measure?key=it.andreafailli.remindme%3Aremindme-backend&metric=bugs)](https://sonarcloud.io/component_measures/metric/reliability_rating/list?it.andreafailli.remindme%3Aremindme-backend)
[![SonarCloud Vulnerabilities](https://sonarcloud.io/api/badges/measure?key=it.andreafailli.remindme%3Aremindme-backend&metric=vulnerabilities)](https://sonarcloud.io/component_measures/metric/security_rating/list?id=it.andreafailli.remindme%3Aremindme-backend)
[![SonarCloud Technical Debt](https://sonarcloud.io/api/badges/measure?key=it.andreafailli.remindme%3Aremindme-backend&metric=sqale_index)](https://sonarcloud.io/component_measures/metric/sqale_index/list?id=it.andreafailli.remindme%3Aremindme-backend)

### [Database](https://github.com/andryfailli/remindme-db)
[![Build Status](https://travis-ci.org/andryfailli/remindme-db.svg?branch=master)](https://travis-ci.org/andryfailli/remindme-db)

## Docker resources

### Deployments
* remindme-db
* remindme-api
* remindme-notifier
* remindme-frontend

### Services
* remindme-db
* remindme-api
* remindme-notifier
* remindme-frontend

### Autoscalers
* remindme-db
* remindme-notifier
* remindme-frontend

### Cron Jobs
* remindme-notifier

### Secrets
* remindme-frontend

## Build
First, you need to register a new [Firebase](https://console.firebase.google.com) application, generate a Firebase Server Key file and place `firebase-server-key.json` into `./remindme-backend/remindme-api/src/main/resources`.

Then, you need to edit frontend environment params in files `./remindme-frontend/src/environments/environment.*.ts`.

If you want to trigger a build, run `mvn clean package` (you need to have Docker installed and running).
You should set these additional arguments
* spring.data.mongodb.uri
* firebase.config.serverKey
For example `mvn -D"spring.data.mongodb.uri"="mongodb://localhost:27017/remindme" -D"firebase.config.serverKey"="...." clean package`.

## Deploy
You need an SSL certificate for testing domain remindme.apps.andreafailli.it.
Setup the following environment variables
* `REMINDME_SECRET_CRT` --> public certificate PEM encoded and then base64 encoded, for frontend domain remindme.apps.andreafailli.it
* `REMINDME_SECRET_KEY` --> certificate private key PEM encoded and then base64 encoded, for frontend domain remindme.apps.andreafailli.it

Make sure you have a running cluster. For development purposes, you can use [Minikube](https://github.com/kubernetes/minikube)

Run `deploy.sh`.

## End-to-End testing
Before start testing, make sure you have a running cluster with RemindMe! deployed. For development purposes, you can use [Minikube](https://github.com/kubernetes/minikube)

Setup the following environment variables
* `REMINDME_E2E_USER_EMAIL` --> valid user email registered into your Firebase project, for end-to-end testing
* `REMINDME_E2E_USER_PASSWORD` --> password of previous user registered into your Firebase project, for end-to-end testing

Make sure you have angular-cli installed (`npm install -g @angular/cli`) and then cd into `./remindme-frontend` and execute `npm install` to download dependencies. Finally exec`ng e2e --environment test`.

You may need to adjust your `hosts` file to correctly resolve remindme.apps.andreafailli.it with Kubernetes Ingress controller.
