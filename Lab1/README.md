Um das Template benutzen zu können, muss man mittels dem Befehl "az login" in Azure eingeloggt sein.

Die Resource-Group und die Dateien müssen in dem Pfad, wo der Command ausgeführt wird, vorhanden sein.


Der Befehl um das Deployment auszuführen:
az deployment group create --resource-group FH2020 --template-file azuredeploy.json --parameters @azuredeploy.parameters.json

Die Erklärung:
az deployment group create 
    --resource-group FH2020 // in diese Resource Group wird deployed, sie muss vorhanden sein
    --template-file azuredeploy.json // dieses ARM-template wird deployed
    --parameters @azuredeploy.parameters.json // mithilfe dieses Parameter-Files kann das ARM-template parametrisiert werden
