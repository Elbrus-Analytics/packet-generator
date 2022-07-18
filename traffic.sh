#!/bin/bash
#file that automatically executes Packet Sender commands

#minimum time the script waits until it tries to establish a new session
MINWAIT=0

#maximum time the script waits until it tries to establish a new session
MAXWAIT=2

#loop until infinity
while true; do
    #read commands from file commands.txt
    input="commands.txt"
    #while the file has lines read them
    while IFS= read -r line
    do
        #print the line -> execute the command
        $line
        #wait a certain period of time
        sleep $(($MINWAIT+$RANDOM % ($MAXWAIT-$MINWAIT)))
        #print output
    done < "$input"
done
