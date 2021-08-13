# Exit script as soon as a command fails.
set -o errexit

ACCESS_TOKEN=$1;

# perepare subgraph
yarn prepare:mainnet; 

# codegen
yarn codegen

# build
yarn build

# change directory
cd subgraphs/exchange

# authenticate
graph auth https://api.thegraph.com/deploy/ $ACCESS_TOKEN

# deploy
yarn deploy:mainnet

