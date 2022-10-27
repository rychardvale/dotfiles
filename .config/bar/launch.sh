#!/usr/bin/env bash

DIR="$HOME/.config/bar" 

# Terminate already running bar instances
pkill polybar

# Launch the bar
sleep 1
polybar -q main -c "$DIR"/config.ini &
