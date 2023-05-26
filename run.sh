#!/bin/sh

ROOT=~/ia

NAME=${1:-"unnamed"}
SERVICE="auto-gpt-$NAME"
DIR=$ROOT/"$NAME"

COMPOSE="
version: '3.9'
services:
  $SERVICE:
    # image: significantgravitas/auto-gpt
    image: autogpt
    env_file:
      - $ROOT/.env
    profiles: ['exclude-from-up']
    volumes:
      - ./auto_gpt_workspace:/app/autogpt/auto_gpt_workspace
      - ./data:/app/data
      - ./logs:/app/logs
"

mkdir -p "$DIR"

if [[ -f "$2" ]]
then
  cp $2 "$DIR/ai_settings.yaml"
fi

if [[ -f "$DIR/ai_settings.yaml" ]]
then
  AI_SETTINGS_FILE=ai_settings.yaml
  COMPOSE="$COMPOSE
      - type: bind
        source: $AI_SETTINGS_FILE
        target: /app/ai_settings.yaml
    environment:
      AI_SETTINGS_FILE: ai_settings.yaml"
fi

cd "$DIR"
echo "$COMPOSE" > docker-compose.yml

docker-compose run --rm $SERVICE
