set -ex

BITCOIN_CORE_VERSION=$(cat BITCOIN_CORE_VERSION)
IMAGENAME=bitcoind
USERNAME=printergobrrr

sudo docker build --build-arg bitcoinCoreVersion=$BITCOIN_CORE_VERSION -t ${USERNAME}/${IMAGENAME} ./
