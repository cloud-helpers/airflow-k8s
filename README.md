## Airflow k8s

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
```
git clone git@git.signintra.com:ADMROZIK/airflow-k8s.git && cd airflow-k8s
minikube start
kubectl apply -f k8s
```
*  after ~30 seconds run the airflow webserver:

`kubectl service web`

*  Then manually trigger a DAG - it will not finish.