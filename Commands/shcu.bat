@echo off
set s=/^?
if [%1] == [] echo The syntax of the command is incorrect. && exit /b
if [%1] == [/?] goto help
powershell "$s=(New-Object -COM WScript.Shell).CreateShortcut('%2');$s.TargetPath='%1';$s.Save()"
if not %errorlevel% == 1 goto created
exit /b
:help
echo Creates a shortcut of file or folder. (Part of CMDextension.)
echo.
echo SHCU [source] [destination(.lnk)]
echo.
echo source		Specifies the file or folder to make an shortcut of.
echo destination	Specifies the location of the folder.
echo.
exit /b

:created
echo Successfully created shortcut of %1 at %2.
echo 	1 shortcut created.
echo.
exit /b