@ECHO OFF
SET ROOT=%~dp0
SET DECRYPT=%ROOT%\..\MainScript\bdo_decrypt.exe
SET ENCRYPT=%ROOT%\..\MainScript\bdo_encrypt.exe
SET REPLACE=%ROOT%\..\MainScript\bdo_replace.exe

SET FOLDER=%1
SET ENG_LOC=%FOLDER%\languagedata_en.loc
SET TW_LOC=%FOLDER%\languagedata_tw.loc
SET TW_LOC_NEW=%FOLDER%\languagedata_tw_new.loc
SET ENG_TXT=%FOLDER%\languagedata_en.txt
SET TW_TXT=%FOLDER%\languagedata_tw.txt
SET TW_TXT_NEW=%FOLDER%\languagedata_tw_new.txt


if "%FOLDER%" EQU "" (
	ECHO Please put BDOLanguage_xxx Folder!
	pause
) else (
	
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
	pause
)
