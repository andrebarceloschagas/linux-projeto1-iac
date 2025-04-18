#!/bin/bash

echo "Iniciando a criação da infraestrutura..."

# --- Criação de Grupos ---
echo "Criando grupos de usuários..."
groupadd GRP_ADM
groupadd GRP_VEN
groupadd GRP_SEC
echo "Grupos criados."

# --- Criação de Diretórios ---
echo "Criando diretórios..."
mkdir /publico
mkdir /adm
mkdir /ven
mkdir /sec
echo "Diretórios criados."

# --- Definição de Dono/Grupo dos Diretórios ---
echo "Definindo donos e grupos dos diretórios..."
chown root:GRP_ADM /adm
chown root:GRP_VEN /ven
chown root:GRP_SEC /sec
chown root:root /publico  # O diretório /publico é acessível a todos, então o dono e grupo são root


# /publico geralmente pertence a root:root por padrão, o que está ok.
echo "Donos e grupos definidos."

# --- Definição das Permissões dos Diretórios ---
echo "Definindo permissões dos diretórios..."
chmod 777 /publico  # Todos podem ler, escrever e executar
chmod 770 /adm      # Apenas root e GRP_ADM podem ler, escrever e executar
chmod 770 /ven      # Apenas root e GRP_VEN podem ler, escrever e executar
chmod 770 /sec      # Apenas root e GRP_SEC podem ler, escrever e executar
echo "Permissões definidas."

# --- Mensagem de Conclusão ---
echo "Infraestrutura criada com sucesso!"

# --- Criação de Usuários ---
echo "Criando usuários e adicionando aos grupos..."

read -sp "Digite a senha para os usuários do grupo GRP_ADM: " senha_adm
echo
read -sp "Digite a senha para os usuários do grupo GRP_VEN: " senha_ven
echo
read -sp "Digite a senha para os usuários do grupo GRP_SEC: " senha_sec
echo

useradd carlos   -m -s /bin/bash -p $(openssl passwd -1 "$senha_adm") -G GRP_ADM
useradd maria    -m -s /bin/bash -p $(openssl passwd -1 "$senha_adm") -G GRP_ADM
useradd joao     -m -s /bin/bash -p $(openssl passwd -1 "$senha_adm") -G GRP_ADM

useradd debora   -m -s /bin/bash -p $(openssl passwd -1 "$senha_ven") -G GRP_VEN
useradd sebastiana -m -s /bin/bash -p $(openssl passwd -1 "$senha_ven") -G GRP_VEN
useradd roberto  -m -s /bin/bash -p $(openssl passwd -1 "$senha_ven") -G GRP_VEN

useradd josefina -m -s /bin/bash -p $(openssl passwd -1 "$senha_sec") -G GRP_SEC
useradd amanda   -m -s /bin/bash -p $(openssl passwd -1 "$senha_sec") -G GRP_SEC
useradd rogerio  -m -s /bin/bash -p $(openssl passwd -1 "$senha_sec") -G GRP_SEC

echo "Usuários criados e adicionados aos grupos."

echo "Fim da execução do script."