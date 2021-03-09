#!/bin/sh

echo "Starting nacos"n && \
cd /usr/nacos/bin && \
./startup.sh -m standalone && \
cd ../logs && \
tail -f start.out 