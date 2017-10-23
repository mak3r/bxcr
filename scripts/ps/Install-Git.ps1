# Attribution
# https://skarlso.github.io/2015/06/30/powershell-can-also-be-nice-or-installing-java-silently-and-waiting/

$source = "https://github.com/git-for-windows/git/releases/download/v2.14.2.windows.3/Git-2.14.2.3-64-bit.exe"
$share = "C:\vagrant\windows"
$dest = "$share\git_for_windows.exe"
$client = new-object System.Net.WebClient

$cookie = "oraclelicense=accept-securebackup-cookie"
$client.Headers.Add([System.Net.HttpRequestHeader]::Cookie, $cookie)
 
Write-Host 'Checking if Git is already installed'
if (Test-Path "C:\Program Files\Git") {
    Write-Host 'No need to Install Git'
    Exit
}
 
Write-Host "Downloading x64 to $dest"
Write-Host "getting git from $source"
 
$client.downloadFile($source, $dest)
if (!(Test-Path $share)) {
    Write-Host "Downloading $dest failed"
    Exit
}
 
 
try {
    Write-Host 'Installing Git for Windows (git bash)'
    $proc1 = Start-Process -FilePath "$dest" -ArgumentList "/verysilent" -Wait -PassThru
    $proc1.waitForExit()
    Write-Host 'Installation Done.'
} catch [exception] {
    write-host '$_ is' $_
    write-host '$_.GetType().FullName is' $_.GetType().FullName
    write-host '$_.Exception is' $_.Exception
    write-host '$_.Exception.GetType().FullName is' $_.Exception.GetType().FullName
    write-host '$_.Exception.Message is' $_.Exception.Message
}
 
if (Test-Path "C:\Program Files\Git") {
    Write-Host 'Git installed successfully.'
}

Write-Host 'Done. Goodbye.'
