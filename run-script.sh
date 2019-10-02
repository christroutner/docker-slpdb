#!/bin/bash

# This file should be copied to the config directory mounted by the Docker
# container at started. Edit this file to customize the environment variables
# controlling the infrastructure that SLPDB depends on.

# Set the MongoDB IP address and port. By default uses the MongoDB Docker
# container bundled in the docker-compose.yml file.
#export db_url=mongodb://localhost:27017
export db_url=mongodb://172.17.0.1:13301


# Set the full node IP address and port
export rpc_host=172.17.0.1
export rpc_port=18332
export rpc_user=bitcoin
export rpc_password=password

export zmq_incoming_host=172.17.0.1
export zmq_incoming_port=38332

# Turn off graph search
export enable_graph_search=0

# Turn off ZMQ output port
export zmq_outgoing_enable=false

npm start
