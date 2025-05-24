#!/bin/bash

# Pedir una lista de enteros separados por espacios
read -p "Introduce una lista de enteros separados por espacios: " -a numeros

# contadores
positivos=0
negativos=0
ceros=0

# Recorre cada número
for num in "${numeros[@]}"
do
  # Validación: ¿es un número entero válido?
  if [[ "$num" =~ ^-?[0-9]+$ ]]; then
    if (( num > 0 )); then
      ((positivos++))
    elif (( num < 0 )); then
      ((negativos++))
    else
      ((ceros++))
    fi
  else
    echo "Advertencia: '$num' no es un número válido y será ignorado."
  fi
done

# resultados
echo "Cantidad de números positivos: $positivos"
echo "Cantidad de números negativos: $negativos"
echo "Cantidad de ceros: $ceros"
