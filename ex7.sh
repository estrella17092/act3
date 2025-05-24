#Escribe un guion para jugar a piedra, papel o tijera contra la
#máquina. El usuario debe poder jugar tantas veces como quiera.
#!/bin/bash

echo "Bienvenido a Piedra, Papel o Tijera contra la máquina."
echo "Escribe 'piedra', 'papel', 'tijera' o 'salir' para terminar."

# Función que elige aleatoriamente para la máquina
elegir_maquina() {
    opciones=("piedra" "papel" "tijera")
    echo "${opciones[$RANDOM % 3]}"
}

while true; do
    read -p "Tu elección: " jugador

    # Convertir a minúsculas
    jugador=$(echo "$jugador" | tr '[:upper:]' '[:lower:]')

    # Salir si el usuario escribe "salir"
    if [[ "$jugador" == "salir" ]]; then
        echo "¡Gracias por jugar!"
        break
    fi

    # Verificar entrada válida
    if [[ "$jugador" != "piedra" && "$jugador" != "papel" && "$jugador" != "tijera" ]]; then
        echo "Opción inválida. Por favor escribe 'piedra', 'papel', 'tijera' o 'salir'."
        continue
    fi

    # Máquina elige
    maquina=$(elegir_maquina)
    echo "La máquina eligió: $maquina"

    # resultado
    if [[ "$jugador" == "$maquina" ]]; then
        echo "¡Empate!"
    elif [[ ("$jugador" == "piedra" && "$maquina" == "tijera") || \
            ("$jugador" == "papel" && "$maquina" == "piedra") || \
            ("$jugador" == "tijera" && "$maquina" == "papel") ]]; then
        echo "¡Ganaste!"
    else
        echo "¡Perdiste!"
    fi

    echo "----------------------------------"
done
