#!/bin/bash

set -e   #caso algum comando falhar ele para o script 

if [ "$EUID" -ne 0 ]; then
  echo "Erro: Por favor, execute este script como root ou com sudo ."
  exit 1
fi
# Criação dos grupos
echo "+==================================================================+"
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
echo "+==================================================================+"
echo " "

# Criação dos diretórios
echo "+==================================================================+"
echo "Criando diretórios..."
mkdir -p /home/sistema
echo "/home/sistema criado"
mkdir -p /home/sistema/aplicacao-java
echo "/home/sistema/aplicacao-java criado"
mkdir -p /home/sistema/aplicacao-python
echo "/home/sistema/aplicacao-python criado"
mkdir -p /home/sistema/banco
echo "/home/sistema/banco criado"
mkdir -p /home/sistema/site-institucional
echo "/home/sistema/site-institucional criado"
echo "Diretórios criados em /home/sistema"
echo "+==================================================================+"

echo "Atribuindo os diretorios aos seus respectivos grupos..."
chown :health-guard /home/sistema/
echo "Diretório 'sistema' atribuido ao grupo helth-guard"
chown -R :DBA /home/sistema/banco/
echo "Diretorio 'banco' atribuido ao grupo DBA"
chown -R :back-end /home/sistema/aplicacao-python/
chown -R :back-end /home/sistema/aplicacao-java/
echo "Diretorios 'aplicacao-python/java' atribuidos ao grupo back-end"
chown -R :front-end /home/sistema/site-institucional/
echo "Diretorio 'site-institucional' atribuido ao grupo front-end"
echo "Concluido"


echo ""
echo "+==================================================================+"
echo "adicionando configurações de permissões de usuario..."
 echo "Instalando ACL('acess control list')"
  apt install acl -y
  chmod 770 /home/sistema/aplicacao-java/
  chmod 770 /home/sistema/aplicacao-python/
  chmod 770 /home/sistema/site-institucional/
  chmod 770 /home/sistema/banco/
  setfacl -m g:health-guard:r-x /home/sistema/site-institucional/
  setfacl -m g:health-guard:r-x /home/sistema/banco/
  setfacl -m g:health-guard:r-x /home/sistema/aplicacao-java/
  setfacl -m g:health-guard:r-x /home/sistema/aplicacao-python/
  echo "permissões configuradas."
  echo ""
echo "+==================================================================+"
echo "Instalação de arquivos e dependencias..."
echo "atualizando pacotes"
apt update
apt upgrade -y
echo "Pacotes atualizados com sucesso"
echo "Instalação do Docker na instancia"
apt install docker.io -y
echo "Docker instalado com sucesso!"
systemctl start docker
systemctl enable docker
echo "Docker configurado com sucesso!"
echo "+==================================================================+"
echo ""
echo "Maquina configurada com sucesso!"
