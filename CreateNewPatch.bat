@ECHO OFF

SET ROOT=%~dp0
SET PROCESSING_LOC=%1
SET DECRYPT=%ROOT%\MainScript\bdo_decrypt.exe
SET ENCRYPT=%ROOT%\MainScript\bdo_encrypt.exe
SET REPLACE=%ROOT%\MainScript\bdo_replace.exe

SET FOLDER=%ROOT%\TEMP
SET ENG_LOC=%FOLDER%\languagedata_en.loc
SET TW_LOC=%FOLDER%\languagedata_tw.loc
SET TW_LOC_NEW=%FOLDER%\languagedata_tw_new.loc
SET ENG_TXT=%FOLDER%\languagedata_en.txt
SET TW_TXT=%FOLDER%\languagedata_tw.txt
SET TW_TXT_NEW=%FOLDER%\languagedata_tw_new.txt

IF EXIST %FOLDER% (
	rmdir /s /q %FOLDER%	
)
mkdir %FOLDER%

if "%PROCESSING_LOC%" EQU "" (
	ECHO Please put languagedata_tw.loc into!
	pause
) else (
	PowerShell -ExecutionPolicy ByPass -File %ROOT%\MainScript\Download_LOC.ps1
	
	copy %PROCESSING_LOC% languagedata_tw_backup.loc
	xcopy /s %PROCESSING_LOC% %FOLDER% /Y		
	
	ECHO Decripting & echo.     %ENG_LOC% & echo.into & echo.     %ENG_TXT%
	CALL %DECRYPT% %ENG_LOC% %ENG_TXT%
	ECHO ====================================================================

	ECHO Decripting & echo.     %TW_LOC% & echo.into & echo.     %TW_TXT%
	CALL %DECRYPT% %TW_LOC% %TW_TXT%
	ECHO ====================================================================

	ECHO Replacing & echo.     %TW_TXT% & echo.with & echo.     %ENG_TXT% & echo.into & echo.     %TW_TXT_NEW%
	CALL %REPLACE% %ENG_TXT% %TW_TXT% %TW_TXT_NEW%
	ECHO ====================================================================

	ECHO Encripting & echo.     %TW_TXT_NEW% & echo.into & echo.     %TW_LOC_NEW%
	CALL %ENCRYPT% %TW_TXT_NEW% %TW_LOC_NEW%
	ECHO ====================================================================
	
	ECHO Coppying & echo.     %TW_LOC_NEW% & echo.into & echo.     %PROCESSING_LOC%
	xcopy /s %TW_LOC_NEW% %PROCESSING_LOC% /Y	
	ECHO ====================================================================
	
	ECHO Enjoy your game! ! !
	pause
)