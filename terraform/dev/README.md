Roteiro de configuração da infra

Terraform apply
criar service connection para o kubernetes e para o docker

az storage account keys list --resource-group fiap-tech-4 --account-name tc3storage --query '[0].value' --output tsv


az storage account keys list --resource-group fiap-tech-4 --account-name tc4storage --query '[0].value' --output tsv | xargs -I '{}' kubectl create secret generic tc4storage-secret \
--from-literal=azurestorageaccountname=tc4storage \
--from-literal=azurestorageaccountkey='{}' -n tc4



## Criando os demais componentes a serem usados

```shell
kubectl create configmap my-config --from-literal=ENV_VAR_NAME=value --from-literal=ANOTHER_VAR=another_value -n custom namespace

kubectl create configmap sql-server-config-map --from-literal=ACCEPT_EULA=Y -n tc4

kubectl create secret generic sql-server-secret \
  --from-literal=MSSQL_SA_PASSWORD=Q1w2e3r4 \
  --from-literal=SVC_PASS=Q1w2e3r4 \
  -n tc4
```