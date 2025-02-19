
# Tech Challenge 3 - Grupo 15

Projeto realizado pelo **Grupo 15** da turma da FIAP de Arquitetura de Sistemas .NET com Azure


## Autores

||
|--|
| Caio Vinícius Moura Santos Maia |
| Guilherme Castro Batista Pereira |
| Evandro Prates Silva |
| Luis Gustavo Gonçalves Reimberg |


## UpdateContact

### Tecnologias Utilizadas
- Azure Repos
- Azure Pipelines
- Kubernets

Dentro da estrutura do tech challenge, este projeto se destina a todos os arquivos de configuração para build e implementação dos recursos necessários na montagem do ambiente dentro da Azure, sendo eles:
- Grafana
- Prometheus
- Ingress
- RabbitMQ
- SQL Server

Através das configurações realizadas foi possível implantar um ambiente de forma automatizada e configurável, favorencendo ao processo mais controlado de subida das aplicações nesta estrutura de microsserviços


# INSTRUÇÕES ADICIONAIS(DESENVOLVIMENTO)
# Como Subir a Infra

1. Subir Fluxo [Terraform](./terraform/README.md)
2. Executar os [Pipelines](https://dev.azure.com/caiomaiavms-fiap/tech-challenge-4/_build)

## Subida do Banco de dados

Execute o [Pipeline de SQL](https://dev.azure.com/caiomaiavms-fiap/tech-challenge-4/_build?definitionId=21) para a branch de dev. Este pipeline buildar a imagem do banco sql server e realizar o deploy no cluster.
Em seguida pegue o IP que foi atribuido ao load balancer do banco de dados e teste a conexão, usando as crecenciais que serão utilizadas na aplicação.
Para  pegar o ip do banco de dados basta executar o seguinte comando:

```shell
kubectl get svc -n tc4 -o jsonpath='{.items[?(@.metadata.name=="sql-server-service")].status.loadBalancer.ingress[0].ip}' |  xargs -I '{}'  echo External IP: '{}'
```
 ## Subida das Aplicações

### Troca de Conection String

Como o IP do banco de dados foi alterado, será necessário a conection string nas aplicações .net. Como esta conection string é criptografada, será necessario criprografá-la utlizando o Crypo.Test na solution do tech challenge 3.


### tc4-get-contacts-api

Para subir esta api basta apenas executa o seu [pipeline](https://dev.azure.com/caiomaiavms-fiap/tech-challenge-4/_build?definitionId=29)
Uma vez finalizado o deply, basta verificar se o pod está rodando. Isto pode ser feito usando o comando

```shell
kubectl get pods -n tc4 | grep get-contacts #Este
```
#### Testes da API

1. Requisição Simples
  **Dependências**: Ingress rodando. (Configurado nos passos abaixo.)
  **Teste**
``` shell
kubectl get ingress -n tc4 -o jsonpath='{.items[?(@.metadata.name=="services-ingress")].status.loadBalancer.ingress[0].ip}' | |  xargs -I '{}'  curl -v http://'{}'/GetContacts/3
```


### tc4-update-contacts-api

Para subir esta api basta apenas executa o seu [pipeline](https://dev.azure.com/caiomaiavms-fiap/tech-challenge-4/_build?definitionId=27)
Uma vez finalizado o deply, basta verificar se o pod está rodando. Isto pode ser feito usando o comando

```shell
kubectl get pods -n tc4 | grep update-contacts #Este
```
#### Testes da API

1. Requisição Simples
  **Dependências**: Ingress rodando. (Configurado nos passos abaixo.)
  **Teste**
``` shell
kubectl get ingress -n tc4 -o jsonpath='{.items[?(@.metadata.name=="services-ingress")].status.loadBalancer.ingress[0].ip}' | xargs -I '{}' curl -X PATCH -v http://'{}'/UpdateContacts/1 -H "Content-Type: application/json" -d "{\"nome\":\"string\",\"email\":\"teste123\",\"ddd\":0,\"telefone\":0}"
```


## Subida do Ingress

### Configuração.

O primeiro passo é instalar um ingress nginx no nosso cluster. O ingress escolhido foi o [Ingress NGINX Controller](https://github.com/kubernetes/ingress-nginx).
Para instalar este ingress basta executar o seguinte comando:


```shell
    kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/main/deploy/static/provider/cloud/deploy.yaml
```
 
Para testar o funcionamento da configuraçào do ingress basta utlizar o comando


```shell
kubectl wait --namespace ingress-nginx \
  --for=condition=ready pod \
  --selector=app.kubernetes.io/component=controller \
  --timeout=120s
```

### Rodar Pipelines

Agora basta rodar o pipeline da configuração [ingress](https://dev.azure.com/caiomaiavms-fiap/tech-challenge-4/_build?definitionId=30).
Para testar a criação do ingress basta executar o comando

```shell
kubectl get ingress -n tc4 | grep services-ingress
```


## Subida do Monitoramento

Como subir as aplicações de monitoramento(prometheus) e visualização(grafana)


### Prometheus

Para subir esta api basta apenas executa o seu [pipeline](https://dev.azure.com/caiomaiavms-fiap/tech-challenge-4/_build?definitionId=33)
Uma vez finalizado o deply, basta verificar se o pod está rodando. Isto pode ser feito usando o comando

```shell
kubectl get pods -n tc4 | grep prometheus #Este
```

**IMPORTANTE:** Caso seja a primeira configuração, é necessário realizar a configuração abaixo


#### Incluindo dependência(imagem base do Prometheus - Docker Hub)

Caso seja a primera configuração do serviço, é necessário adicionar a imagem base do prometheus(docker-hub) no repositório privado(acr), com os seguintes passos:

1. Fazer login no ACR
  **Dependências:** Registry criado e permissão para logar/acessar
```shell
az acr login --name meuRegistry
#Troque o meuRegistry pelo nome do registry de destino
```

2. Puxar a imagem do Prometheus do docker Hub
```shell
docker pull prom/prometheus:v2.24.1
```

3. Definir tag para a imagem no ACR
```shell
docker tag prom/prometheus:v2.24.1 meuRegistry.azurecr.io/prom/prometheus:v2.24.1
#Troque o meuRegistry pelo nome do registry de destino
```

4. Enviar imagem para o ACR
```shell
docker push meuRegistry.azurecr.io/prom/prometheus:v2.24.1
#Troque o meuRegistry pelo nome do registry de destino
```

5. Verificar imagem no ACR
```shell
az acr repository list --name meuRegistry --output table
#Troque o meuRegistry pelo nome do registry de destino
```


#### Testes do serviço

1. Requisição
  **Dependências**: Ingress rodando. (Configurado nos passos acima.)
  **Teste**
``` shell
kubectl get ingress -n tc4 -o jsonpath='{.items[?(@.metadata.name=="services-ingress")].status.loadBalancer.ingress[0].ip}' | xargs -I '{}' curl -X GET http://'{}'/classic/targets
```

2. Acesso via navegador
  **Dependências**: Ingress rodando. (Configurado nos passos acima.)
  **Captura da url de requisição**
```shel
kubectl get ingress -n tc4 -o jsonpath='{.items[?(@.metadata.name=="services-ingress")].status.loadBalancer.ingress[0].ip}' | xargs -I '{}' echo '{}'
```
  **Acessar:** http://URL_CAPTURADA/classic

### Grafana

Para subir esta api basta apenas executa o seu [pipeline](https://dev.azure.com/caiomaiavms-fiap/tech-challenge-4/_build?definitionId=22)
Uma vez finalizado o deply, basta verificar se o pod está rodando. Isto pode ser feito usando o comando

```shell
kubectl get pods -n tc4 | grep grafana #Este
```

**IMPORTANTE:** Caso seja a primeira configuração, é necessário realizar a configuração abaixo


#### Incluindo dependência(imagem base do Grafana - Docker Hub)

Caso seja a primera configuração do serviço, é necessário adicionar a imagem base do grafana(docker-hub) no repositório privado(acr), com os seguintes passos:

1. Fazer login no ACR
  **Dependências:** Registry criado e permissão para logar/acessar
```shell
az acr login --name meuRegistry
#Troque o meuRegistry pelo nome do registry de destino
```

2. Puxar a imagem do Prometheus do docker Hub
```shell
docker pull grafana/grafana:11.2.0
```

3. Definir tag para a imagem no ACR
```shell
docker tag grafana/grafana:11.2.0 meuRegistry.azurecr.io/grafana/grafana:11.2.0
#Troque o meuRegistry pelo nome do registry de destino
```

4. Enviar imagem para o ACR
```shell
docker push meuRegistry.azurecr.io/grafana/grafana:11.2.0
#Troque o meuRegistry pelo nome do registry de destino
```

5. Verificar imagem no ACR
```shell
az acr repository list --name meuRegistry --output table
#Troque o meuRegistry pelo nome do registry de destino
```


#### Testes do serviço

1. Requisição
  **Dependências**: Ingress rodando. (Configurado nos passos acima.)
  **Teste**
``` shell
kubectl get ingress -n tc4 -o jsonpath='{.items[?(@.metadata.name=="services-ingress")].status.loadBalancer.ingress[0].ip}' | xargs -I '{}' curl -X GET http://'{}'/
```

2. Acesso via navegador
  **Dependências**: Ingress rodando. (Configurado nos passos acima.)
  **Captura da url de acesso no navegador**
```shel
kubectl get ingress -n tc4 -o jsonpath='{.items[?(@.metadata.name=="services-ingress")].status.loadBalancer.ingress[0].ip}' | xargs -I '{}' echo '{}'
```
  **Acessar:** http://URL_CAPTURADA/


# Notas


