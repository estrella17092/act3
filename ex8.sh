#Escriba un script que solicite al usuario una contraseña y
#verifique si cumple los siguientes criterios:
#	a) Al menos 8 caracteres
#	b) Contiene al menos 1 letra mayúscula
#	c) Contiene al menos 1 dígito

#!/bin/bash

# Función para validar contraseña
validar_contraseña() {
    local pass="$1"
    local errores=0

    if [ ${#pass} -lt 8 ]; then
        echo "La contraseña debe tener al menos 8 caracteres."
        errores=1
    fi

    if ! [[ "$pass" =~ [A-Z] ]]; then
        echo "La contraseña debe contener al menos una letra mayúscula."
        errores=1
    fi

    if ! [[ "$pass" =~ [0-9] ]]; then
        echo " La contraseña debe contener al menos un dígito."
        errores=1
    fi

    return $errores
}

# Solicitar contraseña hasta que sea válida
while true; do
    read -s -p "Introduce una contraseña segura: " contraseña
    echo
    validar_contraseña "$contraseña"
    if [ $? -eq 0 ]; then
        echo "Contraseña válida. Accediendo al menú..."
        break
    else
        echo "Intenta nuevamente."
    fi
done

# Menú principal
while true; do
    echo ""
    echo "------ MENÚ ------"
    echo "1) Mostrar fecha y hora actual"
    echo "2) Comprobar si un archivo existe"
    echo "3) Salir"
    read -p "Elige una opción: " opcion

    case "$opcion" in
        1)
            echo "Fecha y hora actual: $(date)"
            ;;
        2)
            read -p "Introduce el nombre del archivo o ruta: " archivo
            if [ -e "$archivo" ]; then
                echo "El archivo '$archivo' existe."
            else
                echo "El archivo '$archivo' no existe."
            fi
            ;;
        3)
            echo "Saliendo del programa. ¡Hasta luego!"
            break
            ;;
        *)
            echo "Opción inválida. Por favor elige 1, 2 o 3."
            ;;
    esac
done
