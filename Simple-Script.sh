#!/bin/bash
touch file.txt

user=`whoami`
os=`echo $MACHTYPE`
host=`echo $HOSTNAME`

cat <<EOF
"USER : " $user
"OS   : " $os
"Host : " $host
EOF
