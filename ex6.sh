#Escriba un script que solicite al usuario que introduzca
#tres valores numéricos, uno a la vez. Use un bucle "hasta"
#para seguir preguntando hasta que se introduzcan tres enteros válidos.
#Una vez que tengas los tres valores, debes:
#a) Display their sum (+) Muestra su suma (+)
#b) Display their product (*) Muestra su producto (*)
#c) Show the largest and smallest value Muestra los valores mayor y menor

#!/bin/bash

contador=0
numeros=()

# Función para verificar si el valor ingresado es un entero
es_entero() {
    [[ "$1" =~ ^-?[0-9]+$ ]]
}

echo "Introduce tres números enteros uno a uno:"

until [ $contador -eq 3 ]; do
    read -p "Introduce el número $((contador + 1)): " valor

    if es_entero "$valor"; then
        numeros+=("$valor")
        ((contador++))
    else
        echo "Error: '$valor' no es un número entero válido. Intenta de nuevo."
    fi
done

# Mostrar resultados solicitados
echo
echo "Has ingresado: ${numeros[0]}, ${numeros[1]}, ${numeros[2]}"

# Calcular suma
suma=$((numeros[0] + numeros[1] + numeros[2]))
echo "a) Suma: $suma"

# Calcular producto
producto=$((numeros[0] * numeros[1] * numeros[2]))
echo "b) Producto: $producto"

# Calcular mayor y menor
mayor=${numeros[0]}
menor=${numeros[0]}

for num in "${numeros[@]}"; do
    if (( num > mayor )); then
        mayor=$num
    fi
    if (( num < menor )); then
        menor=$num
    fi
done

echo "c) Mayor valor: $mayor"
echo "   Menor valor: $menor"

