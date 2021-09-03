#!/usr/bin/env bash

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
echo $SCRIPT_DIR

cd $SCRIPT_DIR/unisocket-clients
rm -f out-clients.txt

cd $SCRIPT_DIR/test-latency-before
rm -f out-test.txt

cd $SCRIPT_DIR/test-latency-josef
rm -f out-test.txt

cd $SCRIPT_DIR/test-latency-jozsi
rm -f out-test.txt

cd $SCRIPT_DIR/test-throughput-before
rm -f out-test.txt

cd $SCRIPT_DIR/test-throughput-josef
rm -f out-test.txt

cd $SCRIPT_DIR/test-throughput-jozsi
rm -f out-test.txt

################################
cd $SCRIPT_DIR/unisocket-clients
provisioner --kill >> out-clients.txt 2>&1
./run 0 3000 15m >> out-clients.txt 2>&1 &
 
cd $SCRIPT_DIR/test-latency-before
provisioner --kill >> out-test.txt 2>&1
./run 3 8 20m >> out-test.txt 2>&1 &

wait

################################
cd $SCRIPT_DIR/unisocket-clients
provisioner --kill >> out-clients.txt 2>&1
./run 0 3000 15m >> out-clients.txt 2>&1 &
 
cd $SCRIPT_DIR/test-throughput-jozsi
provisioner --kill >> out-test.txt 2>&1
./run 3 8 20m >> out-test.txt 2>&1 &

wait
