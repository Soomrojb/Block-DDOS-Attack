# Block DDOS Attach

This shell script is designed to locate IPs based on certain keywords from access log(s) and block those IPs using 'ufw'.

Usage:
+ create /home/blockddos.sh file
+ chmod 777 /home/blockddos.sh
+ update cron using 'crontab -e' and add following code

* * * * * /bin/bash /home/blockddos.sh >/dev/null 2>&1
