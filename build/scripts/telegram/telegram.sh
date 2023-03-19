#!/bin/bash
############


#TITLE="$SUBJECT"
#MESSAGE="$DESCRIPTION"


### Read parameters from input flags
while getopts s:d: flag
do
    case "${flag}" in
        s) TITLE=${OPTARG};;
        d) MESSAGE=${OPTARG};;
    esac
done



############
TELEGRAM=/etc/telegram
BOT_TOKEN=$(< $TELEGRAM/token);
CHATID=$(< $TELEGRAM/chatid);
MESSAGE=$(echo -e "$(hostname): $TITLE\n$MESSAGE");

curl -G -s -k "https://api.telegram.org/bot$BOT_TOKEN/sendMessage" --data-urlencode "chat_id=$CHATID" --data-urlencode "text=$MESSAGE" ;
