@echo off
echo merging...  languagedata_en.txt with AllRemovedLines.txt into NewLookUpLoc.txt
copy languagedata_en.txt+echo+AllRemovedLines.txt NewLookUpLoc.txt

echo replacing ...
MainScript\bdo_replace.exe NewLookUpLoc.txt languagedata_tw.txt languagedata_tw_new.txt