#Escriba un script que solicite al usuario que ingrese una ruta
#de directorio y luego muestre los permisos del directorio, la
#cantidad de archivos y subcarpetas que contiene y los nombres
#de todos los archivos y carpetas dentro de él.
#!/bin/bash

# Solicitar la ruta de directorio
read -p "Introduce la ruta de un directorio: " ruta

# Verificar si la ruta existe y es un directorio
if [ ! -d "$ruta" ]; then
    echo "Error: '$ruta' no es un directorio válido."
    exit 1
fi

# Mostrar los permisos del directorio
echo "Permisos del directorio:"
ls -ld "$ruta" | awk '{print $1}'

# Contar archivos y subdirectorios (no incluye ocultos)
total_archivos=$(find "$ruta" -mindepth 1 -maxdepth 1 -type f | wc -l)
total_directorios=$(find "$ruta" -mindepth 1 -maxdepth 1 -type d | wc -l)

echo "Cantidad de archivos: $total_archivos"
echo "Cantidad de subcarpetas: $total_directorios"

# Listar nombres de todos los archivos y carpetas
echo "Contenido del directorio:"
ls -1 "$ruta"

