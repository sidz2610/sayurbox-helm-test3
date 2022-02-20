## Introduction

This chart creates basic deployment in Kubernetes cluster for a webservice application. It creates its deployment, service, pod autoscaling policies and a ingress controller to access the web api.

## Prerequisites

Make sure you have K8s( Minikube or Kind or EKS) cluster with network configuration.

## Chart values file path

| Deployment Environment |      File path     |
|:----------------------:|:------------------:|
|           localhost          |   values.yaml   |

## How to Install this chart

To install the chart with the release name `my-webapp`:
1. Clone the Helm chart Directory
2. Go to pwa-weather-app directory
3. run Shell script by passing arguments.

For Example reference, see below setup and required environment variables.

```
$ DOCKER_HUB="<Example_Repository_URL>" #https://hub.docker.com/pravarag/pwa-weather-app
$ DOCKER_REPO="<Repo_Name>" #pravarag/pwa-weather-app
$ HELM_RELEASE_NAME="my-webapp"
$ HELM_CHART_VALUES_FILE_PATH="./values.yaml"
$ chmod +x ./deploy.sh
$ ./deploy.sh ${HELM_RELEASE_NAME} . ${HELM_CHART_VALUES_FILE_PATH}
```

This command creates my-webapp deployment in local cluster and places services in the kubernetes cluster with ingress controller.

## Health Check
You can test the deployment by making a healthcheck api call

```
$ curl https://localhost:80/healthcheck

```

## Uninstalling the Chart
To uninstall/delete the `${HELM_RELEASE_NAME}` deployment:

```
$ helm delete ${HELM_RELEASE_NAME} --purge
```

The command removes all the Kubernetes components associated with the
chart and deletes the release. This means **all the components**
present in the Namespace created by this chart will also get removed
from cluster.