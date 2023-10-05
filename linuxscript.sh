
	chattr -i /etc/passwd
        chattr -i /etc/passwd
	chattr -i /etc/profile
	chattr -i /etc/bash.bashrc
	chattr -i /etc/login.defs
	chattr -i /etc/pam.d/common-auth
	chattr -i /etc/pam.d/common-password
	chattr -i /etc/group
	chattr -i /etc/shadow
	chattr -i /etc/ssh/sshd_config
	chattr -i /etc/host.conf
	chattr -i /etc/hosts.deny
	chattr -i /etc/hosts.allow
	chattr -i /etc/hosts
	chattr -i /etc/resolv.conf
	chattr -i /etc/default/grub
	chattr -i /etc/grub.d/40_custom
	chattr -i /etc/ers
	chattr -i ~/.mozilla/firefox/*.default/prefs.js
	chattr -i /etc/sysctl.conf
	chattr -i /etc/apt/sources.list

        chown root:root /etc/fstab
	chmod 644 /etc/fstab
	chown root:root /etc/group
	chmod 644 /etc/group
	chown root:root /etc/shadow
	chmod 400 /etc/shadow
	chown root:root /etc/apache2
	chmod 755 /etc/apache2
	chmod 0600 /etc/securetty
	chmod 644 /etc/crontab
	chmod 640 /etc/ftpusers
	chmod 440 /etc/inetd.conf
	chmod 440 /etc/xinetd.conf
	chmod 400 /etc/inetd.d
	chmod 644 /etc/hosts.allow
	chmod 440 /etc/ers
	chmod 640 /etc/shadow
	chmod 600 /boot/grub/grub.cfg
	chmod 600 /etc/ssh/sshd_config
	chmod 600 /etc/gshadow-
	chmod 600 /etc/group-
	chmod 600 /etc/passwd-
 
	chown root:root /etc/ssh/sshd_config
	chown root:root /etc/passwd-
	chown root:root /etc/group-
	chown root:root /etc/shadow
	chown root:root /etc/securetty
	chown root:root /boot/grub/grub.cfg
	chmod og-rwx /boot/grub/grub.cfg
	chown root:shadow /etc/shadow-
	chmod o-rwx,g-rw /etc/shadow-
	chown root:shadow /etc/gshadow-
	chmod o-rwx,g-rw /etc/gshadow-
	touch /etc/cron.allow
	touch /etc/at.allow
	chmod og-rwx /etc/cron.allow
	chmod og-rwx /etc/at.allow
	chown root:root /etc/cron.allow
	chown root:root /etc/at.allow
	chown root:root /etc/cron.d
	chmod og-rwx /etc/cron.d
	chown root:root /etc/crontab
	chmod og-rwx /etc/crontab
	chmod -R g-wx,o-rwx /var/log/


  	apt install apparmor -y
	apt install apparmor-profiles -y
	apt install apparmor-utils -y
	apt install ranger -y
	apt install fail2ban -y

 	#removing nopasswdlogon group
	echo "Removing nopasswdlogon group"
	sed -i -e '/nopasswdlogin/d' /etc/group

	 passwd -l root

	 echo "PermitRootLogin no" >> /etc/ssh/sshd_config
	 echo "Protocol 2" >> /etc/ssh/sshd_config
	 echo "LoginGRaceTime 2m" >> /etc/ssh/sshd_config

         ufw deny 4444
