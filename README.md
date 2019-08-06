
# Install

VPS Manager é um script que vai ajudar na configuração e na manutenção da tua VPS (Servidores virtuais de Linux Ubuntu e Debian).


Neste scrip foram adicionadas as funcionalidades para tornar a VPS totalmente funcional, sendo esta, melhorada face às anteriormente criadas.

# *Vps Manager v3*

Este Script tem como principal funcão a gestão da tua VPS, com ele poderás usar as seguintes ferramentas:

* Menu Colorido
* Criar, Eliminar e Reconfigurar Usuários
* Adicionar/Configurar BadVPN (Necesário para Jogos Online e Chamadas de whatsapp, etc)
* Bloqueio Torrent (Usuários Avançados)
* Monitorização de conecções
* Backup de Usuários
* Criador de Banner para VPS
* Detalhes do Sistema
* Ver Portas Ativas
* Stunnel4 (Instalaão do certificado SSL)
etc.

# Portas instaladas

* Ssh 22
* Dropbear 443
* Squid 80, 8080, 3128

# Instalação do script

Copia e cola o seguinte comando

apt-get update && apt-get upgrade && apt-get install ca-certificates && wget https://raw.githubusercontent.com/sauceisgood/VPSManager/master/install && bash install
