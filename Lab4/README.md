# Deployment

First, navigate to the folder where the `mysql-deployment.yaml` and the `wordpress-deployment.yaml` files are located. The files will later be uploaded to Azure. They contain the information for the containers.

Next, open a terminal.

This command makes you login to Azure:

    az login

Create a AKS in a specified resource group (`fh2020`) using a specific name (`nikaks`):

    az aks create -g fh2020 -n nikaks --node-count 1

To connect to the Kubernetes cluster from your local computer, the the Kubernetes command-line client is needed, known as kubectl.  Install kubectl locally using the command:

    az aks install-cli.

To configure kubectl to connect to your Kubernetes cluster, use the az aks get-credentials command:

    az aks get-credentials --resource-group fh2020 --name nikaks

The following steps are done in the Azure cloud console. To do this launch the bash or PowerShell in Azure cloud on the Azure portal. It is located next to the search bar at the top on the right.

Next a secret will be created on the cluster:

    kubectl create secret generic mysql-pass --from-literal=password=NikDeployment

To ensure it was created you can run the following syntax to list the secrets:

    kubectl get secrets

Now upload both yaml files using the Azure cloud console.

If there is an error that you are not logged in, use the following commands with the *** part being your subscription id.

    az account set --subscription ************-****-****-****-***********
    az aks get-credentials --resource-group fh2020 --name nikaks

You can then crate the MySQL/Wordpress Pod and service using:

    kubectl apply -f /home/strasser/mysql-deployment.yaml
    kubectl apply -f /home/strasser/wordpress-deployment.yaml

You can check to ensure the persistent volume was created by running the following syntax:

    kubectl get pvc

Also, you can run the following syntax to verify the mysql pod is running:

    kubectl get pods


In order to see that the services are running properly and find out the external IP you can run the following syntax:

    kubectl get services 

At last enter the external IP into a browser and then you can setup wordpress.