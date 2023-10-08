
#!/bin/bash

passwd -l root

echo "PermitRootLogin no" >> /etc/ssh/sshd_config
echo "Protocol 2" >> /etc/ssh/sshd_config
echo "AllowUsers hkeating debian" >> /etc/ssh/sshd_config
systemctl restart ssh

apt install ufw -y
#metasploit default port
ufw deny 4444

#sets firewall rules
ufw allow OpenSSH
ufw allow 3306 tcp
ufw allow 
ufw enable



#removing nopasswdlogon group
echo "Removing nopasswdlogon group"
sed -i -e '/nopasswdlogin/d' /etc/group

chmod 644 /etc/passwd


#allow only the scoring user


#updates the repo so we can download our very useful tools
apt update -y
apt install ranger -y
apt install fail2ban -y
apt install tmux -y
apt install curl -y
apt install whowatch -y
apt install neovim -y 

wget https://github.com/DominicBreuker/pspy/releases/download/v1.2.1/pspy64

chmod +x pspy64

for user in $( sed 's/:.*//' /etc/passwd);
	do
	  if [[ $( id -u $user) -ge 999 && "$user" != "nobody" ]]
	  then
		(echo "ExtinctTraitorDuo"; echo "ExtinctTraitorDuo") |  passwd "$user"
	  fi
done

pwck

chattr +i /etc/ssh/sshd_config
