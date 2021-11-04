#!/bin/bash

export LD_LIBRARY_PATH=${STEAMAPPDIR}/linux64:$LD_LIBRARY_PATH

bash ${STEAMCMDDIR}/steamcmd.sh  +login anonymous +force_install_dir ${STEAMAPPDIR} +app_update ${STEAMAPPID} validate +quit

test -d ~/.config/Epic/FactoryGame/Saved || mkdir -p ~/.config/Epic/FactoryGame/Saved
test -d ${STEAMAPPDIR}/saves || mkdir ${STEAMAPPDIR}/saves
test -L ~/.config/Epic/FactoryGame/Saved/SaveGames || ln -s ${STEAMAPPDIR}/saves ~/.config/Epic/FactoryGame/Saved/SaveGames

#exec /FactoryServer.sh

UE4_PROJECT_ROOT=${STEAMAPPDIR}
chmod +x "$UE4_PROJECT_ROOT/Engine/Binaries/Linux/UE4Server-Linux-Shipping"
exec "$UE4_PROJECT_ROOT/Engine/Binaries/Linux/UE4Server-Linux-Shipping" FactoryGame -MultiHome=0.0.0.0 "$@"
