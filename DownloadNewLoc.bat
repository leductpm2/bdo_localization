SET ROOT=%~dp0

PowerShell -executionpolicy remotesigned -File %ROOT%\MainScript\Download_LOC.ps1

pause