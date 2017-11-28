@echo off
set s=/^?
if [%1] == [] echo The syntax of the command is incorrect. && exit /b
if [%1] == [/?] goto help
if [%1] == [/T] goto cleantemp
if [%2] == [/T] goto cleantemp
:after/T
if [%1] == [/r] goto recyclebin
if [%2] == [/r] goto recyclebin
:after/r

exit /b
:help
echo Cleans temp folders. (Part of CMDextension.)
echo.
echo CLEAN [/T] [/?]
echo.
echo  /T	Cleans the standard windows %%%TEMP%% folder.
echo .%s%	Displays this help menu.
echo  /r	Cleans the recycle bin.
echo.
exit /b
:cleantemp
rem cleans %temp%
echo Cleaning Temp Folder
del /q/f/s %TEMP%\*
if %errorlevel% == 1 echo Error occured, try to elevate command prompt(admin rights)
echo Done
if %error%
goto after/T
:recyclebin
rem cleans recyclebin
echo Cleaning Recyclebin
rmdir /s %systemdrive%\$Recycle.bin
if %errorlevel% == 1 echo Error occured, try to elevate command prompt(admin rights)
echo Done
goto after/r