#!/bin/bash

SERVER_IP="127.0.0.1"  # Cambia a la IP del servidor
SERVER_PORT=12345  # Cambia al puerto del servidor
KEY="<clave_hex>"  # Reemplaza con la clave AES proporcionada por el servidor
IV="<iv_hex>"  # Reemplaza con el IV proporcionado por el servidor

while true; do
    echo -n "[Cliente] Ingresa comando: "
    read -r command
    if [[ "$command" == "exit" ]]; then
        encrypted_command=$(echo -n "$command" | openssl enc -aes-128-cbc -a -K $KEY -iv $IV 2>/dev/null)
        echo "$encrypted_command" | nc $SERVER_IP $SERVER_PORT
        echo "[*] Cerrando conexión."
        break
    fi

    encrypted_command=$(echo -n "$command" | openssl enc -aes-128-cbc -a -K $KEY -iv $IV 2>/dev/null)
    response=$(echo "$encrypted_command" | nc $SERVER_IP $SERVER_PORT)
    decrypted_response=$(echo "$response" | openssl enc -aes-128-cbc -d -a -K $KEY -iv $IV 2>/dev/null)

    echo "[Servidor]: $decrypted_response"
done
