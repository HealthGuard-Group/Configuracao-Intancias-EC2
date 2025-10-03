#!/bin/bash

set -e #caso algum comando falhar ele para o script 

if [ "$EUID" -ne 0 ]; then
  echo "Erro: Por favor, execute este script como root ou com sudo."
  exit 1
fi
# Criação dos grupos
echo "+================================+"
echo "Criando grupos..."
groupadd health-guard
echo "Grupo health-guard criado"
groupadd DBA
echo "Grupo DBA criado"
groupadd front-end
echo "Grupo front-end criado"
groupadd back-end 
echo "Grupo back-end criado"
groupadd devops
echo "Grupo devops criado"
echo "Grupos criados."
echo "+================================+"

echo ""

# Criação dos diretórios
echo "=================================+"
echo "Criando diretórios..."
mkdir -p /home/sistema
echo "Pasta Sistema criada"
mkdir -p  /home/sistema/aplicacao-java
echo "Criando /sistema/back-end"
mkdir -p /home/sistema/aplicacao-python
echo "Criando /sistema/front-end"
mkdir -p /home/sistema/banco
echo "Criando /sistema/banco"
mkdir -p /home/sistema/site-institucional
echo "Criando /sistema/site-institucional"
echo "Diretórios criados em /home/sistema"
echo "+===================================+"

echo "Atribuindo os diretorios aos seus respectivos grupos..."
chown :health-guard /home/sistema/
echo "Permissão do grupo health-guard criada"
chown -R :DBA /home/sistema/banco/
echo "Permissão de DBA criada"
chown -R :back-end /home/sistema/aplicacao-python/
chown -R :back-end /home/sistema/aplicacao-java/
echo "Permissão de back-end criada"
chown -R :front-end /home/sistema/site-institucional/
echo "Permissão de front-end criada"

echo ""
echo "+================================+"
echo " Instalação de arquivos e dependencias..."
echo "atualizando pacotes"
apt update
apt upgrade -y
echo "Pacotes atualizados com sucesso"
echo "Instalação do Docker na instancia"
apt install docker.io 
echo "Docker instalado com sucesso!"
systemctl start docker
systemctl enable docker
echo "Docker configurado com sucesso!"
echo "+===============================+"
echo "Maquina configurada com sucesso!"
