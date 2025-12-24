#!/bin/zsh

HOST_IP=""
while [[ -z "$HOST_IP" ]] do
    sleep 1
    HOST_IP=$(hostname -I | awk '{print $1}')
done
echo "Binding to $HOST_IP"

/usr/bin/avahi-publish -a oldlappy.local -R $HOST_IP &
/usr/bin/avahi-publish -a jellyfin.local -R $HOST_IP &
# /usr/bin/avahi-publish -a jellyseerr.local -R $HOST_IP &
/usr/bin/avahi-publish -a radarr.local -R $HOST_IP &
/usr/bin/avahi-publish -a sonarr.local -R $HOST_IP &
/usr/bin/avahi-publish -a bazarr.local -R $HOST_IP &
/usr/bin/avahi-publish -a lidarr.local -R $HOST_IP &
/usr/bin/avahi-publish -a prowlarr.local -R $HOST_IP &
/usr/bin/avahi-publish -a qbittorrent.local -R $HOST_IP &
/usr/bin/avahi-publish -a homeassistant.local -R $HOST_IP &
/usr/bin/avahi-publish -a navidrome.local -R $HOST_IP &
/usr/bin/avahi-publish -a adguardhome.local -R $HOST_IP &
/usr/bin/avahi-publish -a crafty.local -R $HOST_IP &
# /usr/bin/avahi-publish -a immich.local -R $HOST_IP &

while true; do sleep 10000; done
