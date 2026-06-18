#!/usr/bin/env bash
set -e

openssl genrsa -des3 -out local.key 2048
openssl req -key local.key -new -x509 -days 3650 -out local.crt
openssl pkcs12 -inkey local.key -in local.crt -export -out local.pfx
openssl base64 -in local.pfx -out local.base64.pfx