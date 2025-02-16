
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



# Notas


