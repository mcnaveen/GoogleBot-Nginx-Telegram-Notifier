#!/bin/bash

# Author: MC.Naveen
# Shell Script for Monitoring GoogleBot Crawls via Nginx log file and Sending notification to Telegram
# Github: https://github.com/mcnaveen/GoogleBot-Nginx-Telegram-Notifier
# Note: Your server should be Nginx. Otherwise it won't work.

apiKey= PASTE YOUR TELEGRAM API KEY HERE
chatID= PASTE YOUR TELEGRAM CHAT ID HERE
message="GoogleBot HIT" #
logFile=/var/log/nginx/access.log # This is default nginx log path. You can replace the path according to your setup

tail -fn0 $logFile | \
while read line ; do
        echo "$line" | grep "Googlebot"
        if [ $? = 0 ]
        then
          curl --silent --output /dev/null \
          -X POST \
           "https://api.telegram.org/bot$apiKey/sendMessage" \
          -d text= $message \
          -d chat_id=$chatID
        fi
done