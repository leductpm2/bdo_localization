SET ROOT=%~dp0

PowerShell -ExecutionPolicy ByPass -File %ROOT%\MainScript\Download_LOC.ps1

pause
