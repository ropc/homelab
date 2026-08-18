#!/usr/bin/zsh

# set -x
set -e

echo "[start]" $(date)

# update config

sed -i 's/NonInteractiveMode = false/NonInteractiveMode = true/g' /docker/ofdl/config/config.conf
sed -i 's/NonInteractiveModeListName = ""/NonInteractiveModeListName = "yup"/g' /docker/ofdl/config/config.conf
sed -i 's/IncludeExpiredSubscriptions = false/IncludeExpiredSubscriptions = true/g' /docker/ofdl/config/config.conf
# incremental
sed -i 's/DownloadPostsIncrementally = false/DownloadPostsIncrementally = true/g' /docker/ofdl/config/config.conf

timeout -k 1m 1h docker run --rm --pull always \
    -v /media/data/porn/bought/of:/data \
    -v /docker/ofdl/config:/config \
    -p 8090:8080 \
    git.ofdl.tools/sim0n00ps/of-dl:latest --cli

curl 'https://stash.home/graphql' \
    -X POST \
    -H 'content-type: application/json' \
    -H 'Priority: u=0' \
    --data-raw $'{"operationName":"MetadataScan","variables":{"input":{"rescan":false,"scanGenerateClipPreviews":false,"scanGenerateCovers":true,"scanGenerateImagePreviews":false,"scanGeneratePhashes":true,"scanGeneratePreviews":false,"scanGenerateSprites":true,"scanGenerateThumbnails":true,"paths":["/media/data/porn/bought/of"]}},"query":"mutation MetadataScan($input: ScanMetadataInput\041) {\\n  metadataScan(input: $input)\\n}"}'

echo "waiting 30s before tagging"
sleep 30

set +e

for DIR in $(ls -d /media/data/porn/bought/of/*/); do
    /home/ropc/.local/bin/stashtag "${DIR:t}" "${DIR}"
done

echo "\n[end]" $(date)
