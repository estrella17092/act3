#Escribe un script que lea las palabras del teclado y
#las guarde en un archivo hasta que el usuario escriba
#No olvides comprobar si el archivo de destino existe o crearlo antes de escribir.
#!/bin/bash

archivo="palabras.txt"

# Comprobar si el archivo existe o si no se crea
if [ ! -f "$archivo" ]; then
  touch "$archivo"
fi

echo "Escribe lo que quieras guardar en el archivo. Escribe 'No' para terminar."

while true; do
  read -p "Escribe una palabra: " palabra
  if [[ "$palabra" == "No" ]]; then
    echo "Finalizando la escritura."
    break
  fi
  echo "$palabra" >> "$archivo"
done
