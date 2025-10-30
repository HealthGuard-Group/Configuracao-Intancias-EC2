#! /bin/bash

useradd maquina-01 -m
echo "maquina-01:123" |  chpasswd

usermod -aG maquina-01 sudo 

su maquina-01

git clone https://github.com/HealthGuard-Group/Configuracao-Intancias-EC2.git

cd Configuracao-Intancias-EC2.git

cd Assistente de instalação

mv Assistente-instalacao-java-python.sh ..

cd ..

mv Assistente-instalacao-java-python.sh ..

rm -r Configuracao-Intancias-EC2.git

chmod 777 Assistente-instalacao-java-python.sh

./Assistente-instalacao-java-python.sh

rm -r Aplicacao-python

rm -r healthguard_api_looca-1.0-SNAPSHOT.jar


