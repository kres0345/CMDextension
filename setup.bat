@echo off
title CMDextension ^| Installer
net session >nul 2>&1
:: the above is to check for admin rights
if %errorlevel% == 0 goto continue
echo No admin rights detected.
pause
exit /b
:continue
echo NOTE: You can also just add the Commands to PATH and ignore this .bat file
echo Press {enter} to continue, or {close the window} to stop.
pause > nul
copy "%~dp0Commands\*" "C:\Windows"
echo Done installing
pause
exit /b