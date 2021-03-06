#!/bin/sh
echo "
  _     ___ ____ _   _ _   _ __  __
 | |   |_ _/ ___| \ | | | | |  \/  |
 | |    | | |  _|  \| | | | | |\/| |
 | |___ | | |_| | |\  | |_| | |  | |
 |_____|___\____|_| \_|\___/|_|  |_|

 LIGNUM Firmware Uploader

 CPU Model: CORTEX
 Version: 1.0 | Released: 06 august 2016
 Author: Matteo Pisani | matteo.pisani@remoriavr.com
 Copyright: Remoria VR S.r.l.
"
cd "`dirname "$0"`"
echo "Available /dev/cu.* Ports: "
echo "\r"
ls /dev/cu*
echo "\r"
echo "Input the LIGNUM cu.* Port (without quotes|e.g.: cu.usbmodem1D11): "
echo "\r"
read port
echo "\r"
echo "You choosed $port port"
echo "\r"
echo "Performing LIGNUM RESET"
python ./serial_reset.py "/dev/$port"
sleep 3
echo "\r"
echo "Flashing LIGNUM Firmware..."
./bossac -i -d --port=$port -U true -i -e -w -v ./LIGNUM_Firmware.bin -R
echo "\r"
echo "LIGNUM Firmware updated successully."
