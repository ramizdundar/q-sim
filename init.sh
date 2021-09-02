#!/usr/bin/env bash

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
echo $SCRIPT_DIR

cd $SCRIPT_DIR/unisocket-clients
echo $SCRIPT_DIR/unisocket-clients
rm out.txt

cd $SCRIPT_DIR/test-latency-before
echo $SCRIPT_DIR/test-latency-before
rm out.txt

#
cd $SCRIPT_DIR/unisocket-clients
provisioner --kill >> out-client.txt 2>&1
./run 0 1000 20m >> out-client.txt 2>&1 &
 
cd $SCRIPT_DIR/test-latency-before
provisioner --kill >> out-test.txt 2>&1
./run 3 16 20m >> out-test.txt 2>&1 &

wait
