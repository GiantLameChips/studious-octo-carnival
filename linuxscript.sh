
#!/bin/bash

passwd -l root

echo "PermitRootLogin no" >> /etc/ssh/sshd_config
echo "Protocol 2" >> /etc/ssh/sshd_config

apt install ufw -y
#metasploit default port
ufw deny 4444

ufw allow 'Apache Secure'
ufw allow OpenSSH
ufw allow ftp
  	

apt update -y
apt install ranger -y
apt install fail2ban -y
apt install tmux -y
apt install curl -y
apt install whowatch -y
apt install install libapache2-mod-security2 -y    

wget https://github.com/DominicBreuker/pspy/releases/download/v1.2.1/pspy64
chmod +x pspy64

a2enmod userdir
a2enmod headers
a2enmod rewrite
a2dismod imap
a2dismod include
a2dismod info
a2dismod userdir

sudo chown -R root:root /etc/apache2

#removing nopasswdlogon group
echo "Removing nopasswdlogon group"
sed -i -e '/nopasswdlogin/d' /etc/group



