# nginx.sslerr

重现出 客户环境的证书错误
0x805A2FFE 没有双方对等的加密算法 SSL_ERROR_NO_CYPHER_OVERLAP

成功模拟出的用户证书错误场景 `3DES` 算法
```bash
# curl -vvv https://127.0.0.1
* Rebuilt URL to: https://127.0.0.1/
*   Trying 127.0.0.1...
* Connected to 127.0.0.1 (127.0.0.1) port 443 (#0)
* found 129 certificates in /etc/ssl/certs/ca-certificates.crt
* found 516 certificates in /etc/ssl/certs
* ALPN, offering http/1.1
* SSL connection using TLS1.2 / ECDHE_RSA_3DES_EDE_CBC_SHA1
* server certificate verification failed. CAfile: /etc/ssl/certs/ca-certificates.crt CRLfile: none
* Closing connection 0
curl: (60) server certificate verification failed. CAfile: /etc/ssl/certs/ca-certificates.crt CRLfile: none
More details here: http://curl.haxx.se/docs/sslcerts.html

curl performs SSL certificate verification by default, using a "bundle"
 of Certificate Authority (CA) public keys (CA certs). If the default
 bundle file isn't adequate, you can specify an alternate file
 using the --cacert option.
If this HTTPS server uses a certificate signed by a CA represented in
 the bundle, the certificate verification probably failed due to a
 problem with the certificate (it might be expired, or the name might
 not match the domain name in the URL).
If you'd like to turn off curl's verification of the certificate, use
 the -k (or --insecure) option.
```