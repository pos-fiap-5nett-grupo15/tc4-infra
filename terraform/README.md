# Roteiro de configuração da infra

## Criação
1. Rodar os comandos de terraform na pasta ``./terraform/dev/core`` 
Os comando são:

```shell
terraform fmt
terraform init
terraform validate
terraform plan
terraform apply
```

2. Criar alguns recursos via azure cli.
Os comando são os seguintes:
  1. Com o cluster recem criado é necessário baixar novamente as credenciais para usar o kubectl.

```shell
    az aks get-credentials --resource-group fiap-tech-4 --name fiapaks --overwrite-existing
```

  2. Criar o namespace no cluster. **(Obs: talvez seja possível criar este usando o terraform)**

```shell
    kubectl create namespace tc4
```

3. Rodar o segundo terraform que está no folder ``./terraform/dev/kube-config``. Os comando são os mesmos do passo 1.

4. Criar a secret do azure storage no cluster. Esta pode ser feita usando o seguinte comando:

Caso a secret já exista, esta pode ser deletada:
```shell
kubectl delete secret tc4storage-secret -n tc4
```

```shell
az storage account keys list --resource-group fiap-tech-4 --account-name fiaptc4storage --query '[0].value' --output tsv | xargs -I '{}' kubectl create secret generic tc4storage-secret \
--from-literal=azurestorageaccountname=fiaptc4storage \
--from-literal=azurestorageaccountkey='{}' -n tc4
```

5. Por último é necessario recriar as services connections no azure devops, para que o pipeline tenha acesso ao ACR e ao AKS.

[link para página](https://dev.azure.com/caiomaiavms-fiap/tech-challenge-4/_settings/adminservices)


6. Existe um arquivo chamado ``terraform.tfvars`` onde estão escritas as credenciais que serão utilizadas no banco.

```tfvars
#Conteúdo do ./terraform/dev/kube-config/terraform.tfvars

mssql_sa_password = "senha_root"
svc_pass          = "senha_service"

```

## Destruição


1. Rodar os comandos de terraform na pasta ``./terraform/dev/kube-config``.
Os comando são:

```shell
terraform destroy
```

2. Rodar os comandos de terraform na pasta  ``./terraform/dev/core`` 
Os comando são:
```shell
terraform destroy
```


## Rascunho

Terraform apply

### Update Cluster Credentials




criar service connection para o kubernetes e para o docker

Deploy dos demais itens

az storage account keys list --resource-group fiap-tech-4 --account-name tc3storage --query '[0].value' --output tsv


az storage account keys list --resource-group fiap-tech-4 --account-name fiaptc4storage --query '[0].value' --output tsv | xargs -I '{}' kubectl create secret generic tc4storage-secret \
--from-literal=azurestorageaccountname=fiaptc4storage \
--from-literal=azurestorageaccountkey='{}' -n tc4

fiaptc4storage

## Criando os demais componentes a serem usados

```shell
kubectl create configmap my-config --from-literal=ENV_VAR_NAME=value --from-literal=ANOTHER_VAR=another_value -n custom namespace

kubectl create configmap sql-server-config-map --from-literal=ACCEPT_EULA=Y -n tc4

kubectl create secret generic sql-server-secret \
  --from-literal=MSSQL_SA_PASSWORD=senha \
  --from-literal=SVC_PASS=senha \
  -n tc4
```


az storage account create \
    --resource-group fiap-tech-4 \
    --name tc4storage \
    --location eastus \
    --sku Standard_LRS \
    --tags env=dev \
    --access-tier Cool




    fiap-tech-4                    eastus      Succeeded
MC_fiap-tech-4_fiapaks_eastus  eastus      Succeeded
NetworkWatcherRG               eastus      Succeeded