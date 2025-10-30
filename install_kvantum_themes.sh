#!/usr/bin/env bash

set -euo pipefail

# Directorio de temas de Kvantum
KVANTUM_THEMES_DIR="$HOME/.config/Kvantum"

# Asegurarse de que el directorio de temas de Kvantum exista
mkdir -p "$KVANTUM_THEMES_DIR"

# Archivo con la lista de temas
THEMES_FILE="kvantum_themes.conf"

# Directorio temporal para clonar los repositorios
TMP_DIR=$(mktemp -d)
trap 'rm -rf "$TMP_DIR"' EXIT

# Leer cada línea del archivo de temas
while IFS= read -r repo_url || [[ -n "$repo_url" ]]; do
  echo "Descargando tema desde $repo_url..."

  # Clonar el repositorio
  git clone --depth 1 "$repo_url" "$TMP_DIR/theme"

  # Encontrar el directorio del tema buscando un archivo .kvconfig, que es más robusto
  theme_dir=$(find "$TMP_DIR/theme" -name "*.kvconfig" -printf "%h" | head -n 1)

  if [ -z "$theme_dir" ]; then
    echo "No se pudo encontrar el directorio del tema (con archivo .kvconfig) en $repo_url. Saltando."
    rm -rf "$TMP_DIR/theme"
    continue
  fi

  # Copiar el directorio del tema a la carpeta de Kvantum
  cp -r "$theme_dir" "$KVANTUM_THEMES_DIR/"
  echo "Tema $(basename "$theme_dir") instalado."

  # Limpiar para la siguiente iteración
  rm -rf "$TMP_DIR/theme"
done < "$THEMES_FILE"

echo "Instalación de temas de Kvantum completada."
