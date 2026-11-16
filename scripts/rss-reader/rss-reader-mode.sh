#! /bin/bash

set -x

# Load nvm environment
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" # This loads nvm

export ETAG_CACHE=/ansible/rss-reader-etag-cache.json
cd /ansible/rss-reader-mode
npm run start /ansible/rss-reader-config.json
