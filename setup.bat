@echo off
net session >nul 2>&1
:: the above is to check for admin rights
if %errorlevel% == 0 goto continue
echo No admin rights detected.
echo %~dp0
pause
exit /b
:continue
rem my second try to install
echo %~dp0
echo Note you can also just add the Commands to PATH and ignore this .bat file
echo Press enter to continue
pause > nul
copy "%~dp0Commands\*" "C:\Windows"
echo Done installing
pause
exit /b