#!/usr/bin/env bash

mservers="servers.txt"
mails=($(cat ${mservers}))
default=10
range=${1:-$default}

echo "Generating ${range} mail addresses with random account name...:"

for i in $(seq $range) 
do
	for account in $(pwgen -A $(( RANDOM % (15 - 5 + 1 ) + 5 )) 1)
	do
    	domain="${mails[$((RANDOM % ${#mails[@]}))]}"
		echo "${i}. ${account}@${domain}"
	done
done



