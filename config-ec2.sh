#!/bin/bash

# Criação dos grupos
echo "+================================+"
echo "Criando grupos..."
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
mkdir /home/sistema
echo "Criando Pasta Sistema"
mkdir /sistema/back-end
echo "Criando /sistema/back-end"
mkdir /sistema/front-end
echo "Criando /sistema/front-end"
mkdir /sistema/banco
echo "Criando /sistema/banco"
echo "Diretórios criados."
echo "+================================+"

echo ""
echo "+================================+"
