#! /bin/bash

NOTAS_DIR="$HOME/Notas"

mkdir -p "$NOTAS_DIR"

nota=$(ls "$NOTAS_DIR" | fuzzel --prompt=" 󰠮 > " --dmenu)

[ -z "$nota"] && exit 0

if [! -f "$NOTAS_DIR/$nota"]; then
  touch "$NOTAS_DIR/$nota"
fi

kitty --class notas bash -c "nvim '$NOTAS_DIR/$nota'"
