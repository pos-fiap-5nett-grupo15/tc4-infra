# Introduction 
TODO: Give a short introduction of your project. Let this section explain the objectives or the motivation behind this project. 

# Getting Started
TODO: Guide users through getting your code up and running on their own system. In this section you can talk about:
1.	Installation process
2.	Software dependencies
3.	Latest releases
4.	API references

# Build and Test
TODO: Describe and show how to build your code and run the tests. 

# Contribute
TODO: Explain how other users and developers can contribute to make your code better. 

If you want to learn more about creating good readme files then refer the following [guidelines](https://docs.microsoft.com/en-us/azure/devops/repos/git/create-a-readme?view=azure-devops). You can also seek inspiration from the below readme files:
- [ASP.NET Core](https://github.com/aspnet/Home)
- [Visual Studio Code](https://github.com/Microsoft/vscode)
- [Chakra Core](https://github.com/Microsoft/ChakraCore)


# Criando um FileStorage para o SQL Server

```shell
az storage account create \
    --resource-group fiap-tech3 \
    --name tc3storage \
    --location eastus \
    --sku Standard_LRS \
    --tags env=dev \
    --access-tier Cool

az storage account keys list --resource-group fiap-tech3 --account-name tc3storage --query '[0].value' --output tsv

az storage share create --name sql-server-fileshare --account-name tc3storage
```

Agora é necessário criar um secret para receber os dados de autenticação no storage. Uma das formas de fazer isto é utilizar o seguinte comando
```shell
kubectl create secret generic tc3storage-secret \
  --from-literal=azurestorageaccountname=tc3storage \
  --from-literal=azurestorageaccountkey=mKJ8hugH6U1XxstgSYQeylt1eRX1ZzQ6yw1wevXYj+OENfokWlHkuBfz6UdX3QV5BIisPpfjegCy+ASt6vLnvw== \
  -n tc3
```

para passar as variáveis de ambiente podemos usar o configmap e secrets

```shell
kubectl create configmap my-config --from-literal=ENV_VAR_NAME=value --from-literal=ANOTHER_VAR=another_value -n custom namespace

kubectl create configmap sql-server-config-map --from-literal=ACCEPT_EULA=Y -n tc3

kubectl create secret generic sql-server-secret \
  --from-literal=MSSQL_SA_PASSWORD=Q1w2e3r4 \
  --from-literal=SVC_PASS=Q1w2e3r4 \
  -n tc3
```

Agora basta usar estas configuraçõesno yaml.