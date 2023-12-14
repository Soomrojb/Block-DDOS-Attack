#!/bin/bash

# add all apache log files in the array
accesslogs=("/var/log/apache2/websites/website1.com/access.log" "/var/log/apache2/websites/website1.com/access.log")

# add ther terms for searching
srchterms=("/xmlrpc.php" "/cjfuns.php" "/woh.php" "/xxl.php" "/wp-admin/wplogin.php" "/themes/wplogin.php")

for log in ${accesslogs[@]}; do
    for trm in ${srchterms[@]}; do
        cmd=$(tail -n 100 $log | grep "$trm" | cut -d " " -f 1 | xargs -I {} sudo ufw insert 1 deny from {})
        echo $cmd
    done
done
