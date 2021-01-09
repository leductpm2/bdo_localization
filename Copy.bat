@ECHO OFF

SET ROOT=%~dp0
SET FOLDER=%ROOT%\TEMP
SET PROCESSING_LOC=%ROOT%\languagedata_tw.loc
SET TW_LOC_NEW=%FOLDER%\languagedata_tw_new.loc

ECHO Coppying & echo. %TW_LOC_NEW% & echo.into & echo. %PROCESSING_LOC%
xcopy /S /Q /Y /F %TW_LOC_NEW% %PROCESSING_LOC%*
ECHO ====================================================================

ECHO Enjoy your game! ! !
pause
