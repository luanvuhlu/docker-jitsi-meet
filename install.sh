#!/usr/bin/env bash
docker-compose down
sudo rm -rf ~/.jitsi-meet-cfg
cp env.example .env
./gen-passwords.sh
mkdir -p ~/.jitsi-meet-cfg/{web/letsencrypt,transcripts,prosody/config,prosody/prosody-plugins-custom,jicofo,jvb,jigasi,jibri}
docker-compose up -d --build
