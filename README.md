# ssh-gerar-copiar
Gerar e copiar chave ssh para outros servidores.

# SSH Key Deployment and Testing

Este repositório contém scripts para copiar uma chave SSH específica para vários servidores e testar a conexão SSH com esses servidores.

## Scripts

1. **copy_ssh_keys.sh**: Copia a chave SSH para uma lista de servidores.
2. **test_ssh_keys.sh**: Testa a conexão SSH com os servidores para verificar se a chave foi copiada corretamente.

## Pré-requisitos
```bash
    ssh-keygen -t rsa -b 4096 -f /root/.ssh/id_rsa_terraform
 ```
- Uma chave SSH já gerada e localizada em `/root/.ssh/id_rsa_terraform` e `/root/.ssh/id_rsa_terraform.pub`.

## Como Usar

### Passo 1: Copiar a Chave SSH para os Servidores

1. Crie um script chamado `copy_ssh_keys.sh` e adicione o seguinte conteúdo:

    ```bash
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
    ```

2. Torne o script executável:

    ```bash
    chmod +x copy_ssh_keys.sh
    ```

3. Execute o script:

    ```bash
    ./copy_ssh_keys.sh
    ```

### Passo 2: Testar a Conexão SSH

1. Crie um script chamado `test_ssh_keys.sh` e adicione o seguinte conteúdo:

    ```bash
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
    ```

2. Torne o script executável:

    ```bash
    chmod +x test_ssh_keys.sh
    ```

3. Execute o script:

    ```bash
    ./test_ssh_keys.sh
    ```

## Conclusão

Usando estes scripts, você pode facilmente copiar sua chave SSH para vários servidores e verificar se a cópia foi bem-sucedida. Isso facilita a configuração de autenticação SSH sem senha para administração remota.

## Licença

Este projeto está licenciado sob os termos da licença MIT.
