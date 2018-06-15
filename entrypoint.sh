#!/bin/bash
sleep 2

# Change to binary directory

cd /home/container/ShooterGame/Binaries/Linux

# Set Ulimit
ulimit -n 500000
echo "Set: ulimit -n 500000"

# Make internal Docker IP address available to processes.
export INTERNAL_IP=`ip route get 1 | awk '{print $NF;exit}'`

# Replace Startup Variables
MODIFIED_STARTUP=`eval echo $(echo ${STARTUP} | sed -e 's/{{/${/g' -e 's/}}/}/g')`
echo "container~# ${MODIFIED_STARTUP}"

# Run the Server
${MODIFIED_STARTUP}
