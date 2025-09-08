#!/bin/bash

# Criação dos grupos
echo "+================================+"
echo "Criando grupos..."
groupadd QA
echo "Grupo QA criado"
groupadd DevOps
echo "Grupo DevOps criado"
groupadd DBA
echo "Grupo DBA criado"
groupadd Analista
echo "Grupo Analista criado"
groupadd Dev
echo "Grupo Dev criado"
echo "Grupos criados."
echo "+================================+"

echo ""

# Criação dos diretórios
echo "+================================+"
echo "Criando diretórios..."
mkdir -p /sistema/qa
echo "Criando /sistema/qa"
mkdir -p /sistema/devops
echo "Criando /sistema/devops"
mkdir -p /sistema/dba
echo "Criando /sistema/dba"
mkdir -p /sistema/analista
echo "Criando /sistema/analista"
mkdir -p /sistema/dev
echo "Criando /sistema/dev"
echo "Diretórios criados."
echo "+================================+"

echo ""

# Criação do usuário admin com privilégios de root
echo "+================================+"
echo "Criando usuário admin..."
useradd admin -m -s /bin/bash
echo "admin:senhaSegura123" | chpasswd
usermod -aG sudo admin
echo "Usuário admin criado."
echo "+================================+"

echo ""

# Atribuição de grupos aos diretórios
echo "+================================+"
echo "Atribuindo grupos aos diretórios..."
chown root:QA /sistema/qa
chown root:DevOps /sistema/devops
chown root:DBA /sistema/dba
chown root:Analista /sistema/analista
chown root:Dev /sistema/dev
echo "Atribuição completa."
echo "+================================+"

echo ""

# Definição de permissões
echo "+================================+"
echo "Definindo permissões..."
chmod 750 /sistema/qa         # QA: leitura
chmod 770 /sistema/devops     # DevOps: leitura e escrita
chmod 770 /sistema/dev        # Dev: leitura e escrita
chmod 750 /sistema/analista   # Analista: leitura
chmod 770 /sistema/dba        # DBA: leitura, escrita e execução
chmod +x /sistema/dba         # Execução permitida
echo "Permissões definidas."
echo "+================================+"

echo "Cargos, diretórios e permissões criados com sucesso!"
