
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
ufw enable

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

chattr +i /files/Seabiscuit.jpg

# Allow or deny users
echo "hkeating" >> /etc/vsftpd.userlist
echo "userlist_enable=YES" >> /etc/vsftpd.userlist
echo "userlist_file=/etc/vsftpd.userlist" >> /etc/vsftpd.conf
echo "userlist_deny=NO" >> /etc/vsftpd.conf

# General config
echo "anonymous_enable=NO" >> /etc/vsftpd.conf
echo "local_enable=YES" >> /etc/vsftpd.conf
echo "write_enable=YES" >> /etc/vsftpd.conf
echo "dirmessage_enable=NO" >> /etc/vsftpd.conf
echo "xferlog_enable=YES" >> /etc/vsftpd.conf
echo "listen=NO" >> /etc/vsftpd.conf
echo "userlist_enable=YES" >> /etc/vsftpd.conf

echo "ascii_upload_enable=NO" >> /etc/vsftpd.conf
echo "ascii_download_enable=NO" >> /etc/vsftpd.conf



