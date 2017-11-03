@echo off
if [%1] == [] echo The syntax of the command is incorrect. && exit /b
if [%1] == [/?] goto help

exit /b
:help
echo Cleans temp folders. (Part of CMDextension.)
echo.
echo CLEAN [/T] [/?]
echo.
echo  /T		Cleans the standard windows %%%TEMP%% folder.
echo  /?	Displays this help menu.
echo.
exit /b