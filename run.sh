#!/bin/bash

mkdir -p data

podman run -p 15000:15000/udp -p 7777:7777/udp -p 15777:15777/udp -d \
--name=satisfactory -v $PWD/data:/home/steam/Satisfactory-dedicated:Z \
--userns=keep-id --restart=on-failure satisfactory
