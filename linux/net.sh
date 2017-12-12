sudo ip link set dev enp2s0 up
sudo ip addr add 172.17.2.71/21 broadcast 172.17.7.255 dev enp2s0
sudo route add default gw 172.17.0.197
