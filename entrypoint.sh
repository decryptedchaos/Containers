#!/bin/bash
sleep 2

cd /home/container

# Make internal Docker IP address available to processes.
export INTERNAL_IP=`ip route get 1 | awk '{print $NF;exit}'`

# Set Ulimit
ulimit -n 500000
echo "Set: ulimit -n 500000"

# Replace Startup Variables
MODIFIED_STARTUP=`eval echo $(echo ${STARTUP} | sed -e 's/{{/${/g' -e 's/}}/}/g')`
echo "container~# ${MODIFIED_STARTUP}"

# Run the Server
${MODIFIED_STARTUP}
