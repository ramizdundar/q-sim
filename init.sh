#!/usr/bin/env bash
echo "This script does not call \`provisioner --install\` since it is not needed for
  each run. Make sure you installed the simulator on agent machines before
  running this script."

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
echo $SCRIPT_DIR

cd $SCRIPT_DIR/unisocket-clients
rm -f out-clients.txt

cd $SCRIPT_DIR/test-latency-before
rm -f out-test.txt

cd $SCRIPT_DIR/test-latency-5.1-BETA-1
rm -f out-test.txt

cd $SCRIPT_DIR/test-latency-with-hostnames-5.1-BETA-1
rm -f out-test.txt

cd $SCRIPT_DIR/test-throughput-before
rm -f out-test.txt

cd $SCRIPT_DIR/test-throughput-5.1-BETA-1
rm -f out-test.txt

cd $SCRIPT_DIR/test-throughput-with-hostnames-5.1-BETA-1
rm -f out-test.txt

# Latency - Before
cd $SCRIPT_DIR/unisocket-clients
provisioner --kill >> out-clients.txt 2>&1
./run 0 3000 15m >> out-clients.txt 2>&1 &
 
cd $SCRIPT_DIR/test-latency-before
provisioner --kill >> out-test.txt 2>&1
./run 2 4 20m >> out-test.txt 2>&1 &

wait

# Latency - 5.1-BETA-1
cd $SCRIPT_DIR/unisocket-clients
provisioner --kill >> out-clients.txt 2>&1
./run 0 3000 15m >> out-clients.txt 2>&1 &
 
cd $SCRIPT_DIR/test-latency-5.1-BETA-1
provisioner --kill >> out-test.txt 2>&1
./run 2 4 20m >> out-test.txt 2>&1 &

wait

# Latency - 5.1-BETA-1 with hostnames
cd $SCRIPT_DIR/unisocket-clients
provisioner --kill >> out-clients.txt 2>&1
./run 0 3000 15m >> out-clients.txt 2>&1 &
 
cd $SCRIPT_DIR/test-latency-with-hostnames-5.1-BETA-1
provisioner --kill >> out-test.txt 2>&1
./run 2 4 20m >> out-test.txt 2>&1 &

wait

# Throughput - Before
cd $SCRIPT_DIR/unisocket-clients
provisioner --kill >> out-clients.txt 2>&1
./run 0 3000 15m >> out-clients.txt 2>&1 &
 
cd $SCRIPT_DIR/test-throughput-before
provisioner --kill >> out-test.txt 2>&1
./run 2 4 20m >> out-test.txt 2>&1 &

wait

# Throughput - 5.1-BETA-1
cd $SCRIPT_DIR/unisocket-clients
provisioner --kill >> out-clients.txt 2>&1
./run 0 3000 15m >> out-clients.txt 2>&1 &
 
cd $SCRIPT_DIR/test-throughput-5.1-BETA-1
provisioner --kill >> out-test.txt 2>&1
./run 2 4 20m >> out-test.txt 2>&1 &

wait

# Throughput - 5.1-BETA-1 with hostnames
cd $SCRIPT_DIR/unisocket-clients
provisioner --kill >> out-clients.txt 2>&1
./run 0 3000 15m >> out-clients.txt 2>&1 &
 
cd $SCRIPT_DIR/test-throughput-with-hostnames-5.1-BETA-1
provisioner --kill >> out-test.txt 2>&1
./run 2 4 20m >> out-test.txt 2>&1 &

wait
