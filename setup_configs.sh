#!/usr/bin/env bash

set -Eeuo pipefail

# --- Configuración General y Constantes ---
SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &>/dev/null && pwd)"
log() { printf "[%s] %s
" "$(date '+%F %T')" "$*"; }

# --- Función para Crear Enlaces Simbólicos ---
create_symlink() {
  local src="$1"
  local dest="$2"
  local name="$3"

  log "Configurando $name..."
  if [ -L "$dest" ] && [ "$(readlink -f "$dest")" = "$src" ]; then
    log "El enlace simbólico para $name ya existe y es correcto."
  else
    log "Creando enlace simbólico para la configuración de $name."
    if [ -e "$dest" ] || [ -L "$dest" ]; then
      log "Eliminando configuración existente en $dest"
      rm -rf "$dest"
    fi
    mkdir -p "$(dirname "$dest")"
    ln -s "$src" "$dest"
    log "Enlace simbólico para $name creado."
  fi
}

log "== Iniciando script de configuración de dotfiles =="

# --- Enlaces Simbólicos de Directorios de Configuración ---
create_symlink "$SCRIPT_DIR/config/hypr" "$HOME/.config/hypr" "Hyprland"
create_symlink "$SCRIPT_DIR/config/waybar" "$HOME/.config/waybar" "Waybar"
create_symlink "$SCRIPT_DIR/config/kitty" "$HOME/.config/kitty" "Kitty"
create_symlink "$SCRIPT_DIR/config/fuzzel" "$HOME/.config/fuzzel" "Fuzzel"
create_symlink "$SCRIPT_DIR/config/yazi" "$HOME/.config/yazi" "Yazi"

# --- Enlace Simbólico para .zshrc ---
create_symlink "$SCRIPT_DIR/config/zsh/zshrc" "$HOME/.zshrc" "Zsh (.zshrc)"

# --- Themes (Copia de archivos, no enlaces simbólicos) ---
log "Configurando temas..."
THEME_CONFIG_SRC_DIR="$SCRIPT_DIR/config/themes"
CONFIG_DEST_DIR="$HOME/.config"

copy_config_files() {
  local src_dir="$1"
  local dest_dir="$2"
  local name="$3"

  log "Configurando $name..."
  if [ -d "$src_dir" ]; then
    mkdir -p "$dest_dir"
    cp -r "$src_dir"/* "$dest_dir/"
    log "Configuración de $name copiada."
  else
    log "No se encontró el directorio de configuración de $name. Saltando."
  fi
}

copy_config_files "$THEME_CONFIG_SRC_DIR/kvantum" "$CONFIG_DEST_DIR/Kvantum" "Kvantum"
copy_config_files "$THEME_CONFIG_SRC_DIR/qt5ct" "$CONFIG_DEST_DIR/qt5ct" "qt5ct"
copy_config_files "$THEME_CONFIG_SRC_DIR/qt6ct" "$CONFIG_DEST_DIR/qt6ct" "qt6ct"


log "== Script de configuración de dotfiles finalizado =="