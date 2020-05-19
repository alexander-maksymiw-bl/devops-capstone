#!/bin/bash

eksctl create cluster --name maks-capstone --region eu-central-1 --node-type t3.micro --nodes 3 --nodes-min 1 --nodes-max 3 --managed

aws eks --region eu-central-1 update-kubeconfig --name maks-capstone
kubectl apply -f capstone-deployment.yaml
kubectl expose deployment maks-capstone --type=LoadBalancer --name maks-capstone --port 80