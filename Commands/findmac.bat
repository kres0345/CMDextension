@echo off
echo Pinging...
ping -n 2 %1 > nul
if not %errorlevel% == 0 goto Error
echo Displaying ARP Cache
arp -a |findstr "%1"
if not %errorlevel% == 0 goto MacError
exit /B 0

:Error
echo Pinging failed, wrong ip-address?
exit /B 1

:MacError
echo Could not find the ip-address in ARP Cache.
exit /B 1