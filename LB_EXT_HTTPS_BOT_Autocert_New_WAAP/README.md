## Create an Internet exposed HTTPS Load-Balancer with a WAAP Policy assigned on Volterra with Terraform (Origin handled by a Volterra node)

More content and documentation here : https://devcentral.f5.com/s/articles/Create-an-Internet-exposed-HTTPS-Load-Balancer-on-Volterra-with-Terraform

Create an API Certificate from F5XC console

Export CRT & Key from P12 certificate
=====================================

openssl pkcs12 -info -in certificate.p12 -out private_key.key -nodes -nocerts
openssl pkcs12 -info -in certificate.p12 -out certificate.cert -nokeys