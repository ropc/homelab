# /bin/bash
set -x

export PATH=/home/ropc/.local/bin/:$PATH

export METADATA_PATH=/ansible/democracynow-scraper/metadata.json
cd /ansible/democracynow-scraper
pdm run python app.py https://ropc.dev/democracynow.rss /docker/caddy/site/
