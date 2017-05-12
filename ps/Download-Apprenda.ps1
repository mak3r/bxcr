Add-Type -AssemblyName System.IO.Compression.FileSystem

$url = "http://docs.apprenda.com/sites/default/files/Apprenda-6.8.0.zip"
$output = "C:\Apprenda.zip"

(New-Object System.Net.WebClient).DownloadFile($url, $output)
[System.IO.Compression.ZipFile]::ExtractToDirectory("C:\Apprenda.zip", "C:\Apprenda")
Remove-Item "C:\Apprenda.zip"