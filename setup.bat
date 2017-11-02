@echo off
net session >nul 2>&1
:: the above is to check for admin rights
if %errorlevel% == 0 goto continue
echo No admin rights detected.
pause
exit /b
:continue
set /p q1="Do you want to add the files to enviroment PATH?[y/n] "
if q1 == y goto addpath
:afteraddpath
echo Below only recommended if you didnt add to PATH
set /p q2="Do you want a desktop shortcut with cmd open in commands root?[y/n] "
if q2 == y copy CMDextension.lnk "C:\Users\%username%\Desktop\CMDextension.lnk"
::Creates folder in Program Files(x86)
echo Creating folder in "C:\Program Files (x86)\CMDextension"
md "C:\Program Files (x86)\CMDextension"
if not %errorlevel% == 0 echo Error! creating folder went wrong(probaly admin rights).
echo Copy'ing Commands folder into "C:\Program Files (x86)\CMDextension"
copy commands "C:\Program Files (x86)\CMDextension"
if not %errorlevel% == 0 echo Error! Coulnt copy files.

echo Done installing
pause
exit /b
:addpath
set PATH=%PATH%;C:\Program Files (x86)\CMDextension\Commands
if not %errorlevel% == 0 echo Error! Something went wrong with adding path
goto afteraddpath