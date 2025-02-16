# Usa a imagem oficial do RabbitMQ com a Management Plugin habilitada
FROM rabbitmq:3-management

# Define variáveis de ambiente padrão
ENV RABBITMQ_DEFAULT_USER=guest \
    RABBITMQ_DEFAULT_PASS=guest \
    RABBITMQ_DEFAULT_VHOST=/

# Exposição das portas:
# - 5672: porta padrão para AMQP
# - 15672: porta do painel de gerenciamento do RabbitMQ
EXPOSE 5672 15672

# Comando padrão para iniciar o RabbitMQ
CMD ["rabbitmq-server"]
