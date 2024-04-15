#!/bin/sh
set -e

gum confirm 'Are you ready to start?' || exit 0

KUBECONFIG=kubeconfig-01.yaml kubectl --namespace a-team delete \
    --filename crossplane/db-01.yaml

KUBECONFIG=kubeconfig-02.yaml kubectl --namespace a-team delete \
    --filename crossplane/db-02.yaml

az group delete --name $RESOURCE_GROUP --yes

rm kubeconfig*.yaml
