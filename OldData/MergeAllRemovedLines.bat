@echo off
for %%i in (LineRemoved\*) do echo %%i
rem for %%i in (LineRemoved\*) do type %%i >> newfile.txt >> newfile.txt

copy LineRemoved\*.txt AllRemovedLines.txt
