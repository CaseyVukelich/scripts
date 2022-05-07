export EASYRSA=$(pwd)

cd /etc/openvpn/server
cp -r /usr/share/easy-rsa/ /etc/openvpn
cd easy-rsa/

# Generate pki.
./easyrsa init-pki
./easyrsa build-ca
cp pki/ca.crt ../server/

# Generate server sign request.
./easyrsa gen-req server nopass

# Generate keys/pem.
cp pki/private/server.key ../server/
openvpn --genkey secret /etc/openvpn/server/ta.key
openssl dhparam -out dh.pem 2048

# All keys in the client and server pki/reqs/*req need to be moved to ca server for signing.
# The current server will be the ca server for convenience.
./easyrsa import-req pki/reqs/server.req serverimportedreq
./easyrsa import-req ~/client1.req client1
./easyrsa sign-req server serverimportedreq
./easyrsa sign-req client client1

# Send back client/server certs.
cp pki/issued/serverimportedreq.crt ../server/
cp pki/issued/client1.crt ~
