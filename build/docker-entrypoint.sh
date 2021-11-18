#!/bin/sh
set -e

#CHANGEME
export MONIKER=changeme
export KEY=changeme
export KEYPASS=changeme


export CHAINID="evmos_9000-2"
if [ ! -f /root/.evmosd/setupdone ]
then
  evmosd init $MONIKER --chain-id=$CHAINID
  curl https://raw.githubusercontent.com/tharsis/testnets/main/olympus_mons/genesis.json > ~/.evmosd/config/genesis.json
  TESTNET_REPO="https://raw.githubusercontent.com/tharsis/testnets/main/olympus_mons"
  export PEERS="$(curl -s "$TESTNET_REPO/peers.txt")"
  export SEEDS="$(curl -s "$TESTNET_REPO/seeds.txt")"
  export PEERS_NO_LB=$(echo -n $PEERS)
  export PEERS_NO_SPACE=$(echo $PEERS_NO_LB | sed 's/ /,/g' -)
  export SEEDS_NO_LB=$(echo -n $SEEDS)
  export SEEDS_NO_SPACE=$(echo $SEEDS_NO_LB | sed 's/ /,/g' -)
  sed -i -e "s/^persistent_peers *=.*/persistent_peers = \"$PEERS_NO_SPACE\"/" ~/.evmosd/config/config.toml
  sed -i -e "s/^seeds *=.*/seeds = \"$SEEDS_NO_SPACE\"/" ~/.evmosd/config/config.toml
  sed -i -e "s/^prometheus =.*/prometheus = true/" ~/.evmosd/config/config.toml
  evmosd validate-genesis
  evmosd config chain-id evmos_9000-2
  yes $KEYPASS | evmosd keys add $KEY
  evmosd add-genesis-account $(yes $KEYPASS | evmosd keys show $KEY -a) 1000000000000aphoton
  yes $KEYPASS | evmosd gentx $KEY 1000000000000aphoton --commission-rate=0.1 --commission-max-rate=1 --commission-max-change-rate=0.1 --pubkey $(evmosd tendermint show-validator) --chain-id=evmos_9000-2
  touch /root/.evmosd/setupdone
fi
sleep infinity
