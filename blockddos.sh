#!/bin/bash

# add all apache log files in the array
accesslogs=("/var/log/apache2/websites/website1.com/access.log" "/var/log/apache2/websites/website1.com/access.log")

# add ther terms for searching
srchterms=("/xmlrpc.php" "/cjfuns.php" "/woh.php" "/xxl.php" "/wp-admin/wplogin.php" "/themes/wplogin.php" "BLEXBot/" "/weddingtips.ph" "Bytespider;" "PetalBot;" "/system_log.ph" "wlwmanifest.xml" "login_sid.lua" "Go-http-client" ".env.old" ".env.production" ".env%20" "cp/.env" "cp/.env" "?phpinfo=-1" "/exporttool/" "DotBot")

for log in ${accesslogs[@]}; do
    for trm in ${srchterms[@]}; do
        cmd=$(tail -n 100 $log | grep "$trm" | cut -d " " -f 1 | xargs -I {} sudo ufw insert 1 deny proto tcp from {} to any port 80,443 comment 'Auto blocked')
        echo $cmd
    done
done
