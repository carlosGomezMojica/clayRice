#!/bin/bash

INCREMENTO="$1"  # El primer parámetro: -10 o 10 para bajar o subir

# Definir las direcciones de los buses I2C para ambos monitores
BUS_DISPLAY1="/dev/i2c-1"  # Bus para Display 1 (HP 27fw)
BUS_DISPLAY2="/dev/i2c-2"  # Bus para Display 2 (LG HDR WFHD)

# Obtener el brillo actual de Display 1
BRILLO_ACTUAL1=$(sudo ddcutil --bus="$BUS_DISPLAY1" getvcp 0x10 | grep -oP '(?<=current value: )\d+')

# Obtener el brillo actual de Display 2
BRILLO_ACTUAL2=$(sudo ddcutil --bus="$BUS_DISPLAY2" getvcp 0x10 | grep -oP '(?<=current value: )\d+')

# Si no se obtiene el brillo, salir
if [ -z "$BRILLO_ACTUAL1" ] || [ -z "$BRILLO_ACTUAL2" ]; then
    echo "No se pudo obtener el brillo actual de los monitores."
    exit 1
fi

# Calcular el nuevo brillo
NUEVO_BRILLO1=$((BRILLO_ACTUAL1 + INCREMENTO))
NUEVO_BRILLO2=$((BRILLO_ACTUAL2 + INCREMENTO))

# Limitar el brillo para que no sea mayor a 100 o menor a 0
if [ "$NUEVO_BRILLO1" -gt 100 ]; then
    NUEVO_BRILLO1=100
elif [ "$NUEVO_BRILLO1" -lt 0 ]; then
    NUEVO_BRILLO1=0
fi

if [ "$NUEVO_BRILLO2" -gt 100 ]; then
    NUEVO_BRILLO2=100
elif [ "$NUEVO_BRILLO2" -lt 0 ]; then
    NUEVO_BRILLO2=0
fi

# Ajustar el brillo de ambos monitores
sudo ddcutil --bus="$BUS_DISPLAY1" setvcp 0x10 "$NUEVO_BRILLO1"
sudo ddcutil --bus="$BUS_DISPLAY2" setvcp 0x10 "$NUEVO_BRILLO2"

echo "Nuevo brillo para Display 1: $NUEVO_BRILLO1"
echo "Nuevo brillo para Display 2: $NUEVO_BRILLO2"
