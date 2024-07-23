#!/bin/bash

mkdir -m 777 -p speedtest_results


echo "Retrieving server list..."
servers=$(speedtest-cli --list | awk -F ') ' '{print $1}' | grep -E '^[0-9]+$')


if [ -z "$servers" ]; then
    echo "No servers found. Exiting."
    exit 1
fi

for server in $servers; do
    echo "Testing server ID: $server"
    result_file="speedtest_results/server_11.csv"
    speedtest-cli --server $server >> "$result_file"
    echo "Results saved to $result_file"
done

echo "Test done..."
