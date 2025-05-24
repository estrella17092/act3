#Escriba un script que primero recupere la lista de cuentas
#de usuario del sistema que contengan mayúsculas. A continuación,
#solicite al usuario que introduzca un nombre de usuario.
#Si el nombre de usuario introducido no es válido (es decir,
#no existe), mostrará un mensaje de error.  Una vez introducido 
#un nombre de usuario válido, se mostrará TODA la información 
#disponible sobre ese usuario del sistema.
#!/bin/bash

# Recuperar lista de usuarios que contienen mayúsculas en su nombre
echo "Usuarios con mayúsculas en el nombre:"
usuarios_mayus=$(cut -d: -f1 /etc/passwd | grep '[A-Z]')
echo "$usuarios_mayus"

# Solicitar nombre de usuario
read -p "Introduce un nombre de usuario: " usuario

# Comprobar si el usuario existe en el sistema
if ! id "$usuario" &>/dev/null; then
  echo "Error: El usuario '$usuario' no existe."
  exit 1
fi

# Mostrar toda la información disponible sobre el usuario
echo "Información del usuario '$usuario':"
getent passwd "$usuario"
