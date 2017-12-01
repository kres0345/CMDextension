@echo off
if [%1] == [/?] goto help
goto start
echo Work in progress

exit /b
:start
if exist "%temp%\size.ps1" (
	goto write
	echo file exist
) else (
	goto write
	echo file doesnt exist
)

rem https://stackoverflow.com/questions/12813826/get-folder-size-from-windows-command-line
rem powershell.exe -executionpolicy bypass -file $env:TEMP\size.ps1
exit /b
:write
echo Writing...
echo switch((ls -r^|measure -s Length).Sum) { > %temp%\size.ps1
echo   {$_ -gt 1GB} { >> %temp%\size.ps1
echo     '{0:0.0} GiB' -f ($_/1GB) >> %temp%\size.ps1
echo     break >> %temp%\size.ps1
echo   } >> %temp%\size.ps1
echo   {$_ -gt 1MB} { >> %temp%\size.ps1
echo     '{0:0.0} MiB' -f ($_/1MB) >> %temp%\size.ps1
echo     break >> %temp%\size.ps1
echo   } >> %temp%\size.ps1
echo   {$_ -gt 1KB} { >> %temp%\size.ps1
echo     '{0:0.0} KiB' -f ($_/1KB) >> %temp%\size.ps1
echo     break >> %temp%\size.ps1
echo   } >> %temp%\size.ps1
echo   default { "$_ bytes" } >> %temp%\size.ps1
echo } >> %temp%\size.ps1
echo Done.
goto start
exit /b
:execute
echo Initiating...
powershell.exe -executionpolicy bypass -file $env:TEMP\size.ps1

exit /b


rem ps script
rem switch((ls -r|measure -s Length).Sum) {
  {$_ -gt 1GB} {
    '{0:0.0} GiB' -f ($_/1GB)
    break
  }
  {$_ -gt 1MB} {
    '{0:0.0} MiB' -f ($_/1MB)
    break
  }
  {$_ -gt 1KB} {
    '{0:0.0} KiB' -f ($_/1KB)
    break
  }
  default { "$_ bytes" }
}
