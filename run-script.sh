#!/bin/bash

# This file should be copied to the config directory mounted by the Docker
# container at started. Edit this file to customize the environment variables
# controlling the infrastructure that SLPDB depends on.

# Set the MongoDB IP address and port
#export db_url=mongodb://localhost:27017
export db_url=mongodb://172.17.0.1:12301


# Set the full node IP address and port
export rpc_host=192.168.0.36
export rpc_port=8332

npm start
