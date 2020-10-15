
openssl genrsa -out rootCA.key 2048
openssl req -new -x509 -days 3650 -key rootCA.key -out rootCA.crt -subj "/CN=wafl CA"
openssl genrsa -out rootCA.key 2048

rm -rf ~/.anyproxy/certificates
mkdir -p ~/.anyproxy/certificates/
cp rootCA.key ~/.anyproxy/certificates/
cp rootCA.crt ~/.anyproxy/certificates/