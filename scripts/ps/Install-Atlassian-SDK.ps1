# Attribution

$source = "https://marketplace.atlassian.com/download/plugins/atlassian-plugin-sdk-windows"
$share = "C:\vagrant\windows"
$dest = "$share\atlassian_sdk.exe"
$client = new-object System.Net.WebClient
$install_dir = "C:\Applications\Atlassian"
 
Write-Host 'Checking if Atlassian is already installed'
if (Test-Path "$install_dir") {
    Write-Host 'No need to Install Atalassian SDK'
    Exit
}
 
Write-Host "getting Atlassian from $source"
Write-Host "Downloading Atlassian SDK to $dest"
 
$client.downloadFile($source, $dest)
if (!(Test-Path $share)) {
    Write-Host "Downloading $dest failed"
    Exit
}
 
 
try {
    Write-Host 'Installing Atlassian SDK'
    $proc1 = Start-Process -FilePath "$dest" -ArgumentList "-q" -Wait -PassThru
    $proc1.waitForExit()
    Write-Host 'Installation Done.'
} catch [exception] {
    write-host '$_ is' $_
    write-host '$_.GetType().FullName is' $_.GetType().FullName
    write-host '$_.Exception is' $_.Exception
    write-host '$_.Exception.GetType().FullName is' $_.Exception.GetType().FullName
    write-host '$_.Exception.Message is' $_.Exception.Message
}
 
if (Test-Path "$install_dir") {
    Write-Host 'Atlassian SDK installed successfully.'
}

Write-Host 'Done. Goodbye.'
