#!/bin/bash

# Start cupsd server
echo "Starting cups..."
cupsd -f -c /etc/cups/cupsd.conf &

# Wait for cups web api to start
sleep 5

echo "Listing connected printers"
DIRECT_PRINTER=`lpinfo -v | grep '^direct' | grep "Dai+Nippon+Printing" | cut -d\  -f 2`

# Setup printers
if [ "$DIRECT_PRINTER" != "" ]; then
  echo "Installing $DIRECT_PRINTER"
  lpadmin -p DNP -E -v "$DIRECT_PRINTER" -P /root/DNP.ppd
else
  echo "DNP Printer not found."
fi

sleep infinity
