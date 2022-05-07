export EASYRSA=$(pwd)

cd /etc/openvpn/server
cp -r /usr/share/easy-rsa/ /etc/openvpn
cd easy-rsa/

./easyrsa init-pki
./easyrsa gen-req client1 nopass
