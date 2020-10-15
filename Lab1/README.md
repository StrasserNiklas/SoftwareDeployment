The ARM template (azuredeploy.json) creates an Azure storage account and a node web app using parameters (azuredeploy.parameters.json).

To use the template, the Azure CLI must be installed (https://docs.microsoft.com/en-us/cli/azure/install-azure-cli) and you have to be logged into Azure using the command "az login".

The resource group and the files have to be in the path the command is executed.

The command to execute the deployment:

    az deployment group create --resource-group FH2020 --template-file azuredeploy.json --parameters @azuredeploy.parameters.json

Explanation of the command:

    az deployment group create 

    --resource-group FH2020 // the deployment happens in this resource group, it has to exist

    --template-file azuredeploy.json // this ARM-template will be deployed 

    --parameters @azuredeploy.parameters.json // this file makes the parametrization of the the ARM-template possible 

If the resource group doesn´t yet exist, you can either create it on the Azure portal or using the command:

    az group create --name "FH2020" --location "West Europe"

Following is the explanation of the parameters in the azuredeploy.parameters.json file. For each parameter, there is a default value used in the azuredeploy.json file if the parameter is empty:

 - storageAccountName
	 - The name of the storage account that will be created
 - webAppName
	 - The name of the web app that will be created
 - language
	 - The language the web app uses, for example: node, .Net
 - sku
	 - The pricing tier to be used
 - repoUrl
	 - The github repository to be hosted
 - location
	 - the location for the storage account

More information about ARM-templates can be found at: https://docs.microsoft.com/en-us/azure/azure-resource-manager/templates/overview