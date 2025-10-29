#! /bin/bash
set -e 

if [ "$EUID" -ne 0 ]; then
  echo "Erro: Por favor, execute este script como root ou com sudo ."
  exit 1
fi
echo "Atualizando pacotes"
apt update 
apt upgrade -y

echo "Preparando Ambiente para Aplicação JAVA..."
echo "====================================================================================================="

echo "Instalando JRE..."
apt install default-jre -y
echo "JRE instalado com sucesso!"
echo ""
echo "Clonando repositório com aplicação..."
git clone https://github.com/HealthGuard-Group/Aplicacao-Java.git
echo "Buscando arquivo .jar "
cd Aplicacao-Java
cd Java\ Executavel/
mv healthguard_api_looca-1.0-SNAPSHOT.jar ..
cd ..
mv healthguard_api_looca-1.0-SNAPSHOT.jar ..
cd .. 
rm -r Aplicacao-Java/
echo "Preparação para o JAVA concluida!"
echo ""
echo "====================================================================================================="
echo "Preparando Ambiente para Aplicação PYTHON..."
echo "====================================================================================================="

echo "Baixando pip e venv"
apt install python3-pip -y 
apt install python3.12-venv -y
echo "Clonando repositório com aplicação"
git clone https://github.com/HealthGuard-Group/Aplicacao-Python.git
echo "Entrando no repositório clonado"
cd Aplicacao-Python/
cd Scripts

echo "Criando .env..."

cat > '.env' <<EOF
HOST_DB = '44.199.59.133'
USER_DB = 'logan'
PASSWORD_DB = 'senha-segura123'
DATABASE_DB = 'HealtGuard'
EOF

echo "Criando venv..."
python3 -m venv venv
echo "Ativando ambiente"
source venv/bin/activate
echo "Instalando bibliotecas"
pip3 install -r requirements.txt
cd
echo ""
echo ""
echo ""
echo "Ambiente configurado para rodar aplicação python e java!"
echo ""
echo "|=========================================================================|"
echo "|                       PASSO A PASSO PARA CAPTURAS                       |"
echo "|=========================================================================|"
echo "| EXECUTANDO CAPTURA DE PYTHON :                                          |"
echo "| - Acesse a pasta 'Scripts' que esta no repositório 'Aplicacao-Python'   |"
echo "| Para executar a captura de python insira no teminal:                    |"
echo "| - 'Source venv/bin/activate' (para ativar o ambiente)                   |" 
echo "| - 'python ScriptCapturaPython.py' (para iniciar o script )              |"
echo "|                                                                         |" 
echo "| EXECUTANDO CAPTURA DE JAVA                                              |" 
echo "| - Acesse a pasta que está o arquivo .jar                                |"
echo "| Para executar arquivo java insira no terminal:                          |"
echo "| -'java -jar healthguard_api_looca-1.0-SNAPSHOT.jar'                     |"
echo "|                                                                         |" 
echo "|=========================================================================|