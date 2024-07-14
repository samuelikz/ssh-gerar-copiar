#!/bin/bash

# Caminho para a chave pública
KEY_PATH="/root/.ssh/id_rsa_terraform.pub"

# Lista de servidores
servers=("10.0.0.25" "10.0.0.11" "10.0.0.12")

# Usuário no servidor remoto
USER="root"

# Copiar a chave para cada servidor
for server in "${servers[@]}"; do
    ssh-copy-id -i "$KEY_PATH" "$USER@$server"
done
