#!/bin/bash

# Load OS information
sleep 10
. /etc/os-release
IFACE=$(ip route | grep default | awk '{print $5}')

# Detect configuration based on network manager
if command -v networkd-dispatcher &>/dev/null; then
CONFIG_FILE="/etc/networkd-dispatcher/routable.d/50-masq"
elif command -v NetworkManager &>/dev/null; then
CONFIG_FILE="/etc/NetworkManager/dispatcher.d/ifup-local"
else
exit 1
fi

# Setup configuration based on gateway type
if [[ "$gateway" == *"/"* ]]; then
cat <<-EOF > $CONFIG_FILE && chmod +x $CONFIG_FILE
#!/bin/bash
echo 1 > /proc/sys/net/ipv4/ip_forward
iptables -t nat -A POSTROUTING -s '${gateway}' -o $IFACE -j MASQUERADE
EOF
elif [[ -n "$gateway" ]]; then
cat <<-EOF > $CONFIG_FILE && chmod +x $CONFIG_FILE
#!/bin/bash
ip route add default via ${gateway}
EOF
else
exit 1
fi

# Setup DNS configuration based on resolved manager
sed -i 's/#DNS=/DNS=185.12.64.2 185.12.64.1/g' /etc/systemd/resolved.conf || true

# Reboot to apply changes
reboot
