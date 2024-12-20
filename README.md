# SecureReverseShellAES

Herramienta de reverse shell segura en Bash con cifrado AES-128-CBC para evadir detecciones en entornos con SIEM, IPS o IDS.

## Descripción

Esta herramienta incluye scripts para un cliente y un servidor que permiten la comunicación cifrada mediante el algoritmo AES-128-CBC. El objetivo principal es ofrecer una capa adicional de seguridad para evitar detecciones comunes en sistemas de seguridad como SIEM, IPS o IDS.

## Archivos incluidos

1. `Cliente.sh`: Script del cliente para enviar comandos cifrados al servidor.
2. `Server.sh`: Script del servidor que descifra los comandos, los ejecuta y responde con los resultados cifrados.

## Características

- Cifrado AES-128-CBC para garantizar la seguridad de los datos transmitidos.
- Capacidad de ejecutar comandos de manera remota y segura.
- Diseñado para entornos de prueba y educativos.

## Requisitos

- **bash**
- **netcat (nc)**
- **openssl**

## Configuración inicial

1. Ejecuta el servidor (`Server.sh`) para generar la clave AES y el IV.
2. Copia manualmente la clave (`AES Key`) y el IV generados por el servidor al cliente (`Cliente.sh`).

## Ejecución

### Servidor
1. Ejecuta el servidor:
   ```bash
   ./Server.sh
   ```
2. Anota la clave y el IV generados.

### Cliente
1. Edita el script `Cliente.sh` e introduce la clave y el IV proporcionados por el servidor.
2. Ejecuta el cliente:
   ```bash
   ./Cliente.sh
   ```
3. Ingresa comandos en el cliente para ejecutarlos de manera remota.
4. Escribe `exit` para cerrar la conexión.

## Ejemplo de uso

### Servidor
```bash
$ ./Server.sh
AES Key: 1234567890abcdef1234567890abcdef
AES IV: abcdef1234567890
Listening on [0.0.0.0] (family 0, port 12345)
```

### Cliente
```bash
$ ./Cliente.sh
[Cliente] Ingresa comando: ls
[Servidor]: file1.txt\nfile2.txt\n
[Cliente] Ingresa comando: exit
[*] Cerrando conexión.
```

## Notas importantes

- **Fines educativos:** Esta herramienta está diseñada para aprender sobre cifrado y comunicación segura. No debe usarse en entornos de producción sin implementar medidas de seguridad adicionales.
- **Seguridad del IV y la clave:** La seguridad depende de mantener la clave y el IV protegidos.
