#!/bin/bash

# Caminho para a chave privada
KEY_PATH="/root/.ssh/id_rsa_terraform"

# Lista de servidores
servers=("10.0.0.25" "10.0.0.11" "10.0.0.12")

# Usuário no servidor remoto
USER="root"

# Testar a conexão SSH para cada servidor
for server in "${servers[@]}"; do
    echo "Testando conexão com $server..."
    ssh -i "$KEY_PATH" "$USER@$server" 'echo "Conexão bem-sucedida com $server"'
    if [ $? -eq 0 ]; then
        echo "Conexão com $server foi bem-sucedida!"
    else
        echo "Falha ao conectar com $server."
    fi
done
