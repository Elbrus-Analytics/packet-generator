#!/bin/bash
#file that automatically executes Packet Sender commands

MINWAIT=0
MAXWAIT=2
while true; do
    ./AppRun -taw 1000 www.blogger.com 80 "GET /"
    input="commands.txt"
    while IFS= read -r line
    do
        $line
        sleep $(($MINWAIT+$RANDOM % ($MAXWAIT-$MINWAIT)))
    done < "$input"
done