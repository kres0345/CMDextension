@echo off
net session >nul 2>&1
:: the above is to check for admin rights
if %errorlevel% == 0 goto continue
echo No admin rights detected.
pause
exit /b
:continue
rem my second try to install
echo Note you can also just add the Commands to PATH and ignore this .bat file
set /p q3="Are you sure you wan't to install CMDextension in the C:\Windows folder[y/n]: "
if q3 == y copy Commands\* "C:\Windows" && echo Tried to install it in C:\Windows
echo Done installing
pause
exit /b