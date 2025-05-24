#Cree un script que compruebe si hay conexión a internet con el sitio
#web de la escuela. Si no hay conexión, se mostrará una advertencia y
#3se esperarán 5 segundos antes de volver a intentarlo. Una vez que la
#3conexión esté disponible, abra el navegador predeterminado (p. ej., Firefox)
#con la página de inicio de la escuela.
#!/bin/bash

# URL del sitio web de la escuela
URL="https://agora.xtec.cat/ies-sabadell/"

echo "Comprobando conexión con $URL..."

# Bucle hasta que haya conexión
while true; do
    # Comprobamos si hay respuesta usando curl con timeout corto
    if curl -s --head --request GET "$URL" | grep "200 OK" > /dev/null; then
        echo "Conexión establecida con $URL"
        break
    else
        echo "Sin conexión. Reintentando en 5 segundos..."
        sleep 5
    fi
done

# Abrir en navegador predeterminado
# Puedes cambiar "firefox" por "xdg-open" para hacerlo más genérico
echo "Abriendo el sitio en el navegador..."
xdg-open "$URL" 2>/dev/null || firefox "$URL"
