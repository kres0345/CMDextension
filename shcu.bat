echo %1
powershell "$s=(New-Object -COM WScript.Shell).CreateShortcut('%userprofile%\Start Menu\Programs\Startup\%~n0.lnk');$s.TargetPath='%~f0';$s.Save()"
pause