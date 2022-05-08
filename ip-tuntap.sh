# create TUN
ip tuntap add mode tun dev tun0
ip addr add 10.0.0.5/24 dev tun0
ip link set dev tun0 up

# delete TUN
ip link set dev tun0 down
ip tuntap del mode tun dev tun0

# create TAP
ip tuntap add mode tap dev tap0
ip addr add 10.0.0.5/24 dev tap0
ip link set dev tap0 up

# delete TAP
ip link set dev tap0 down
ip tuntap del mode tap dev tap0
