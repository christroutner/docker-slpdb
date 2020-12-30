#!/bin/bash
docker container run --name slpdb --rm \
-v /mnt/usb/slpdb/data/leveldb:/home/safeuser/SLPDB/_leveldb \
-v /mnt/usb/slpdb/config:/home/safeuser/config \
-it slpdbmainnet_slpdb /bin/bash

