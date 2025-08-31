#!/bin/bash

INTERFACES=("usb0" "usb1")

for iface in "${INTERFACES[@]}"; do
    carrier_file="/sys/class/net/$iface/carrier"
    if [ -f "$carrier_file" ] && [ "$(cat $carrier_file)" -eq 1 ]; then
        nmcli radio wifi off
        exit 0
    fi
done

nmcli radio wifi on