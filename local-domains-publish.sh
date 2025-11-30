#!/bin/bash

#function _term {
#  pkill -P $$
#}

#trap _term SIGTERM

/usr/bin/avahi-publish -a oldlappy.local -R 192.168.1.122 &
/usr/bin/avahi-publish -a jellyfin.local -R 192.168.1.122 &
/usr/bin/avahi-publish -a jellyseerr.local -R 192.168.1.122 &
/usr/bin/avahi-publish -a radarr.local -R 192.168.1.122 &
/usr/bin/avahi-publish -a sonarr.local -R 192.168.1.122 &
/usr/bin/avahi-publish -a prowlarr.local -R 192.168.1.122 &
/usr/bin/avahi-publish -a qbittorrent.local -R 192.168.1.122 &
/usr/bin/avahi-publish -a homeassistant.local -R 192.168.1.122 &

while true; do sleep 10000; done
