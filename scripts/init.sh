#!/bin/bash

echo "Starting Bitcoind... brrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr"

CONF_FILE=/conf/pruned-bitcoin.conf

rpcAuthLine=$(grep ^rpcauth= $CONF_FILE)

if [[ $rpcAuthLine == *"AUTOGEN"* ]]; then
  /scripts/resetRpcPassword.sh
fi

if [[ -z "$(ls -A /data)" ]]; then
  /scripts/quickstart.sh
else
  echo "Found existing blockchain data. Resuming node from the last known block..."
fi

bitcoind -conf=/conf/pruned-bitcoin.conf
