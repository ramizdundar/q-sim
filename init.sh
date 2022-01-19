#!/usr/bin/env bash
echo "This script does not call \`provisioner --install\` since it is not needed for
  each run. Make sure you installed the simulator on agent machines before
  running this script."

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
echo $SCRIPT_DIR

# Cleanup the outputs of previous runs
echo Starting to cleanup
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

echo Finished cleanup

# Latency - Before
echo Running the latency test with the commit before the hostname fix
cd $SCRIPT_DIR/unisocket-clients
provisioner --kill >> out-clients.txt 2>&1
./run 0 1500 15m >> out-clients.txt 2>&1 &
 
cd $SCRIPT_DIR/test-latency-before
provisioner --kill >> out-test.txt 2>&1
./run 3 8 20m >> out-test.txt 2>&1 &

wait
echo Finished the latency test with the commit before the hostname fix

# Latency - 5.1-BETA-1
echo Running the latency test with 5.1-BETA-1
cd $SCRIPT_DIR/unisocket-clients
provisioner --kill >> out-clients.txt 2>&1
./run 0 1500 15m >> out-clients.txt 2>&1 &
 
cd $SCRIPT_DIR/test-latency-5.1-BETA-1
provisioner --kill >> out-test.txt 2>&1
./run 3 8 20m >> out-test.txt 2>&1 &

wait
echo Finished the latency test with 5.1-BETA-1

# Latency - 5.1-BETA-1 with hostnames
echo Running the latency test with hostnames on 5.1-BETA-1
cd $SCRIPT_DIR/unisocket-clients
provisioner --kill >> out-clients.txt 2>&1
./run 0 1500 15m >> out-clients.txt 2>&1 &
 
cd $SCRIPT_DIR/test-latency-with-hostnames-5.1-BETA-1
provisioner --kill >> out-test.txt 2>&1
./run 3 8 20m >> out-test.txt 2>&1 &

wait
echo Finished the latency test with hostnames on 5.1-BETA-1

# Throughput - Before
echo Running the throughput test with the commit before the hostname fix
cd $SCRIPT_DIR/unisocket-clients
provisioner --kill >> out-clients.txt 2>&1
./run 0 1500 15m >> out-clients.txt 2>&1 &
 
cd $SCRIPT_DIR/test-throughput-before
provisioner --kill >> out-test.txt 2>&1
./run 3 8 20m >> out-test.txt 2>&1 &

wait
echo Finished the throughput test with the commit before the hostname fix


# Throughput - 5.1-BETA-1
echo Running the throughput test with 5.1-BETA-1
cd $SCRIPT_DIR/unisocket-clients
provisioner --kill >> out-clients.txt 2>&1
./run 0 1500 15m >> out-clients.txt 2>&1 &
 
cd $SCRIPT_DIR/test-throughput-5.1-BETA-1
provisioner --kill >> out-test.txt 2>&1
./run 3 8 20m >> out-test.txt 2>&1 &

wait
echo Finished the throughput test with 5.1-BETA-1


# Throughput - 5.1-BETA-1 with hostnames
echo Running the throughput test with hostnames on 5.1-BETA-1
cd $SCRIPT_DIR/unisocket-clients
provisioner --kill >> out-clients.txt 2>&1
./run 0 1500 15m >> out-clients.txt 2>&1 &
 
cd $SCRIPT_DIR/test-throughput-with-hostnames-5.1-BETA-1
provisioner --kill >> out-test.txt 2>&1
./run 3 8 20m >> out-test.txt 2>&1 &

wait
echo Finished the throughput test with hostnames on 5.1-BETA-1
