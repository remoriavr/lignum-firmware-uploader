#!/bin/sh
echo "
  _     ___ ____ _   _ _   _ __  __
 | |   |_ _/ ___| \ | | | | |  \/  |
 | |    | | |  _|  \| | | | | |\/| |
 | |___ | | |_| | |\  | |_| | |  | |
 |_____|___\____|_| \_|\___/|_|  |_|

 LIGNUM Firmware Uploader

 CPU Model: CORTEX
 Version: 1.0 | Released: 10 august 2016
 Author: Matteo Pisani | matteo.pisani@remoriavr.com
 Copyright: Remoria VR S.r.l.
"
cd "`dirname "$0"`"
echo "Available /dev/tty.* Ports: "
echo "\r"
ls /dev/tty*
echo "\r"
echo "Input the LIGNUM tty.* Port (without quotes|e.g.: ttyACM0): "
echo "\r"
read port
echo "\r"
echo "You choose $port port"
echo "\r"
echo "Performing LIGNUM RESET"
python ./serial_reset.py "/dev/$port"
sleep 3
echo "\r"
echo "Flashing LIGNUM Firmware..."
./bossac -i -d --port=$port -U true -i -e -w -v ./LIGNUM_Firmware.bin -R
echo "\r"
echo "LIGNUM Firmware updated successully."
