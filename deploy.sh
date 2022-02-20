#!/bin/bash
set -e
POSITIONAL=()
while [[ $# -gt 0 ]]
do
key="$1"

case $key in
    --helm_release_name)
    HELM_RELEASE_NAME="$2"
    shift # past argument
    shift # past value
    ;;
     --values)
    VALUES="$2"
    shift # past argument
    shift # past value
    ;;
    --helm_chart_name)
    HELM_CHART_NAME="$2"
    shift # past argument
    shift # past value
    ;;
    *)    # unknown option
    POSITIONAL+=("$1") # save it in an array for later
    shift # past argument
    ;;
esac
done
set -- "${POSITIONAL[@]}" # restore positional parameters
cd ${HELM_CHART_NAME}
sudo -E helm install ${HELM_RELEASE_NAME} ${HELM_CHART_NAME} -f "${HELM_CHART_VALUES_FILE_PATH}"
kubectl get deployment
kubectl rollout status --watch deployment/${HELM_RELEASE_NAME}