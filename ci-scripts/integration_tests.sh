#!/bin/bash

#
echo "K8S nodes:"
kubectl --kubeconfig="$(kind get kubeconfig-path)" get nodes

echo "K8S pods"
kubectl --kubeconfig="$(kind get kubeconfig-path)" get pods --all-namespaces -o wide

echo "Launching Airflow pods"
kubectl --kubeconfig="$(kind get kubeconfig-path)" apply -f k8s

# kubectl get pods --all-namespaces -o wide

