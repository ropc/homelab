#!/usr/bin/zsh

# set -x

echo "[start]" $(date)

set -o allexport; source /ansible/backup.env; set +o allexport

btrbk run

LATEST_PATH="$(btrbk list latest -t | awk 'NR>1 {print $NF}')"

ln -sfn "${LATEST_PATH}" /media/internal/personal-backups/latest

SNAP_NAME="$(basename "$LATEST_PATH")"

restic backup \
    --tag "btrbk:${SNAP_NAME}" \
    "${LATEST_PATH}"

echo "[end]" $(date)
