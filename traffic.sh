#!/bin/bash
#file that automatically executes Packet Sender commands

MINWAIT=0
MAXWAIT=2
while true; do
    input="commands.txt"
    while IFS= read -r line
    do
        $line
        sleep $(($MINWAIT+$RANDOM % ($MAXWAIT-$MINWAIT)))
    done < "$input"
done