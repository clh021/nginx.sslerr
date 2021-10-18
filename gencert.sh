#!/bin/sh

rm -r certs
mkdir certs

openssl req \
    -config cert.config.conf \
    -subj "/C=CN/ST=SC/L=CD/O=XY/OU=FF/CN=gateway.netiler.com" \
    -new -x509 -sha256 \
    -newkey rsa:2048 \
    -nodes \
    -keyout certs/cert.key \
    -days 3650 \
    -out certs/cert.pem

