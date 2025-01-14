#! /bin/bash

echo "Criando as imagens..."

docker build -t daviddevlinux/projeto-backend:1.0 backend/.
docker build -t daviddevlinux/projeto-database:1.0 database/.

echo "Realizando o push das imagens..."

docker push daviddevlinux/projeto-backend:1.0
docker push daviddevlinux/projeto-database:1.0

echo "Criando serviços no cluster Kubernetes..."
kubectl apply -f ./services.yml

echo "Criando os deployments..."
kubectl apply -f ./deployment.yml
