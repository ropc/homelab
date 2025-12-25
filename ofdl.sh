#!/usr/bin/zsh

# set -x

date

# update config

sed -i 's/NonInteractiveMode = false/NonInteractiveMode = true/g' /docker/ofdl/config/config.conf
sed -i 's/NonInteractiveModeListName = ""/NonInteractiveModeListName = "yup"/g' /docker/ofdl/config/config.conf
# incremental
sed -i 's/DownloadPostsIncrementally = false/DownloadPostsIncrementally = true/g' /docker/ofdl/config/config.conf

docker run --rm --pull always -v /media/data/porn/bought/of:/data \
    -v /docker/ofdl/config:/config \
    -p 8080:8080 \
    git.ofdl.tools/sim0n00ps/of-dl:latest

curl 'http://oldlappy.local:9999/graphql' \
    -X POST \
    -H 'content-type: application/json' \
    -H 'Priority: u=0' \
    --data-raw $'{"operationName":"MetadataScan","variables":{"input":{"rescan":false,"scanGenerateClipPreviews":false,"scanGenerateCovers":true,"scanGenerateImagePreviews":false,"scanGeneratePhashes":false,"scanGeneratePreviews":false,"scanGenerateSprites":false,"scanGenerateThumbnails":true,"paths":["/data/drive/bought/of"]}},"query":"mutation MetadataScan($input: ScanMetadataInput\041) {\\n  metadataScan(input: $input)\\n}"}'

echo  # output newline
