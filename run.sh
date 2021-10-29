#!/bin/bash

mkdir -p data/steamcmd
mkdir -p data/satisfactory

podman run --rm -p 15000:15000/udp -p 7777:7777/udp -p 15777:15777/udp -d \
--name=satisfactory -v $PWD/data:/home/steam/Satisfactory-dedicated:Z \
$PWD/steamcmd:/home/steam/steamcd:Z --user 1000 satisfactory
