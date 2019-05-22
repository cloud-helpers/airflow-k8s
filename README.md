Airflow k8s
===========

[![Build Status](https://travis-ci.com/cloud-helpers/airflow-k8s.svg?branch=master)](https://travis-ci.com/cloud-helpers/airflow-k8s)
[![Docker Repository on Quay](https://quay.io/repository/cloudhelpers/airflow-k8s/status "Docker Repository on Quay")](https://quay.io/repository/cloudhelpers/airflow-k8s)

Docker image is using entrypoint.sh at the beginning to run webserver/scheduler
properly.

Right now the CI part is failing as there is no Docker login setup to push the
image, nor kubernetes cluster to deploy to (this is intended, will be fixed
as soon as airflow starts executing DAGs correctly).

The issue seems to be that airflow webserver does not see airflow scheduler 
and DAGs are always in the running state

In order to recreate the issue:


*  Install [Minikube](https://kubernetes.io/docs/tasks/tools/install-minikube/)
*  Run this code:
```bash
$ mkdir -p ~/dev/infra
$ git clone https://github.com/cloud-helpers/airflow-k8s ~/dev/infra/airflow-k8s
$ pushd ~/dev/infra/airflow-k8s
$ minikube start
$ kubectl apply -f k8s
$ popd
```

* After ~30 seconds run the airflow webserver:
```bash
$ minikube service web
```

* Then manually trigger a DAG - it will not finish.


