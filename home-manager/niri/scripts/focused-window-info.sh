#!/usr/bin/env bash
WINFO=$(niri msg focused-window)
APPID=$(echo $WINFO | grep -o 'App ID: "[^"]*"' | cut -d'"' -f2)
TITLE=$(echo $WINFO | grep -o 'Title: "[^"]*"' | cut -d'"' -f2)
dms notify --app "Window Information" --icon window "App ID: ${APPID}" "Title: ${TITLE}"
wl-copy "${TITLE}"
wl-copy "${APPID}"
