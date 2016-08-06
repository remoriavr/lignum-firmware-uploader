@echo off
type header.txt
@echo:
echo Available COM Ports: 
@echo:
python list_serial.py
@echo:
set /p COM_PORT=Input the LIGNUM COM Port (without quotes): 
@echo:
echo You choosed %COM_PORT%
@echo:
echo Performing LIGNUM RESET
@echo:
mode %COM_PORT%:1200,n,8,1
timeout 2 > NUL
@echo:
echo Refreshing COM Ports list:
@echo: 
python list_serial.py
@echo:
timeout 1 > NUL
set /p UPDATED_COM_PORT=If changed, input the new LIGNUM COM Port: 
bossac.exe -i -d --port=%UPDATED_COM_PORT% -U true -i -e -w -v LIGNUM_Firmware.bin -R
@echo:
echo LIGNUM Firmware updated successully.
@echo:
pause