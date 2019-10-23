Add-Type -AssemblyName System.IO.Compression.FileSystem
function Unzip
{
	param([string]$zipfile, [string]$outpath)

	[System.IO.Compression.ZipFile]::ExtractToDirectory($zipfile, $outpath)
}

$version=(new-object net.webclient).DownloadString('http://akamai-gamecdn.blackdesertonline.com/live001/game/config/config.language.version')

Write-Host "Current version of English Loc: " $version

$url_file = "http://akamai-gamecdn.blackdesertonline.com/live001/game/language/BDOLanguage_$version.zip"
Write-Host "Url for download new English Loc: " $url_file

$output_Zip = "$PSScriptRoot\..\TEMP\BDOLanguage_$version.zip"
$output_Folder = "$PSScriptRoot\..\TEMP"
Write-Host "Output Zip directory: " $output_Zip
Write-Host "Output Folder directory: " $output_Folder

if (!(Test-Path $output_Zip -PathType Leaf) -and !(Test-Path $output_Folder -PathType Leaf))
{
	$start_time = Get-Date
	Invoke-WebRequest -Uri $url_file -OutFile $output_zip
	Write-Output "Download Time taken: $((Get-Date).Subtract($start_time).Seconds) second(s)"
	
	Unzip $output_Zip $output_Folder
}
else
{
	Write-Host "Already downloaded!"	
}
