http://www.buchatech.com/2019/01/deploy-mysql-and-wordpress-on-azure-kubernetes-service-aks/

https://techcommunity.microsoft.com/t5/azure-database-for-mysql/deploy-a-wordpress-app-using-helm-with-azure-database-for-mysql/ba-p/1579902

az login
az aks create -g fh2020 -n nikaks --node-count 1
az aks get-credentials --resource-group fh2020 --name nikaks

kubectl get nodes

kubectl create secret generic mysql-pass --from-literal=password=NikDeployment
kubectl get secrets

Dann zu azure cloud bash
Beide files uploaden

In Shell:
az account set --subscription 306a3198-398f-45cf-bc88-f1becef3d807
az aks get-credentials --resource-group fh2020 --name nikaks
kubectl apply -f /home/strasser/mysql-deployment.yaml
kubectl apply -f /home/strasser/wordpress-deployment.yaml

You can check to ensure the persistent volume was created by running the following syntax:

    kubectl get pvc

Also, you can run the following syntax to verify the mysql pod is running:

    kubectl get pods


In order to see that the services are running properly and find out the external IP you can run the following syntax:

    kubectl get services 

Dort die external IP suchen und in Browser eingeben, dort geht dann Wordpress setup