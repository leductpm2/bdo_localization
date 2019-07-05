in the file get_removed_lines.bat
	Rem old line and
	Add more line if there are new BDOLanguagePack follow template

	BDO_GetRemovedLine.exe BDOLanguage_[newVersion]\languagedata_en.txt BDOLanguage_[oldVersion]\languagedata_en.txt languagedata_en_removed_[newVersion].txt
	
in the file MergeAllRemovedLines.bat
run it to merge all file inside into 1 file  AllRemovedLines.txt, which contains all lines that are removed.
Merge this file with newest version for more line translate