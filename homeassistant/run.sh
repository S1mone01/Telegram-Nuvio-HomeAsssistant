#!/bin/bash
set -e

CONFIG_PATH=/data/options.json

if [ -f "$CONFIG_PATH" ]; then
    echo "Loading configuration from Home Assistant..."
    export API_ID=$(jq --raw-output '.API_ID // empty' $CONFIG_PATH)
    export API_HASH=$(jq --raw-output '.API_HASH // empty' $CONFIG_PATH)
    export BOT_TOKEN=$(jq --raw-output '.BOT_TOKEN // empty' $CONFIG_PATH)
    export OWNER_ID=$(jq --raw-output '.OWNER_ID // empty' $CONFIG_PATH)
    export DATABASE=$(jq --raw-output '.DATABASE // empty' $CONFIG_PATH)
    export PORT=$(jq --raw-output '.PORT // empty' $CONFIG_PATH)
fi

echo "Starting Telegram Stremio..."
uv run update.py && uv run -m Backend
