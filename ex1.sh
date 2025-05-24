#Escriba un script que elimine los comentarios (líneas que empiezan con # y
#terminan) de un archivo. Una vez eliminados, pregunte al usuario si una palabra
#o frase determinada existe en el archivo. Luego, pídale que añada una oración al
#final del archivo (este paso es obligatorio).
#!/bin/bash

# Pedir nombre del archivo
read -p "Introduce el nombre del archivo: " archivo

# Verifica si el archivo existe
if [[ ! -f "$archivo" ]]; then
  echo "El archivo no existe."
  exit 1
fi

# Elimina líneas que comienzan con #
grep -v '^#' "$archivo" > temp.txt
mv temp.txt "$archivo"
echo "Comentarios eliminados."

# Busca palabra o la frase
read -p "Introduce una palabra o frase para buscar en el archivo: " frase

if grep -qF "$frase" "$archivo"; then
  echo "La frase SÍ se encuentra en el archivo."
else
  echo "La frase NO se encuentra en el archivo."
fi

# Pide una oración para añadir al final del archivo
while true; do
  read -p "Introduce una oración para añadir al final del archivo: " oracion
  if [[ -n "$oracion" ]]; then
    echo "$oracion" >> "$archivo"
    echo "Oración añadida correctamente."
    break
  else
    echo "La oración no puede estar vacía. Inténtalo de nuevo."
  fi
done
