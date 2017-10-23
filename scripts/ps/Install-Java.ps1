# Attribution
# https://skarlso.github.io/2015/06/30/powershell-can-also-be-nice-or-installing-java-silently-and-waiting/

$JDK_VER="8u152"
$JDK_FULL_VER="8u152-b16"
$JDK_PATH="1.8.0_152"
#$source64 = "http://download.oracle.com/otn-pub/java/jdk/$JDK_FULL_VER/jdk-$JDK_VER-windows-x64.exe"
$source64 = "http://download.oracle.com/otn-pub/java/jdk/8u152-b16/aa0333dd3019491ca4f6ddbe78cdb6d0/jdk-8u152-windows-x64.exe"
$share = "C:\vagrant\windows"
$destination64 = "$share\$JDK_VER-x64.exe"
$client = new-object System.Net.WebClient
$cookie = "oraclelicense=accept-securebackup-cookie"
$client.Headers.Add([System.Net.HttpRequestHeader]::Cookie, $cookie)
 
Write-Host 'Checking if Java is already installed'
if (Test-Path "c:\Program Files\Java") {
    Write-Host 'No need to Install Java'
    Exit
}
 
Write-Host "Downloading x64 to $destination64"
Write-Host "getting java from $source64"
 
$client.downloadFile($source64, $destination64)
if (!(Test-Path $share)) {
    Write-Host "Downloading $destination64 failed"
    Exit
}
 
 
try {
    Write-Host 'Installing JDK-x64'
    $proc1 = Start-Process -FilePath "$destination64" -ArgumentList "/s REBOOT=ReallySuppress" -Wait -PassThru
    $proc1.waitForExit()
    Write-Host 'Installation Done.'
} catch [exception] {
    write-host '$_ is' $_
    write-host '$_.GetType().FullName is' $_.GetType().FullName
    write-host '$_.Exception is' $_.Exception
    write-host '$_.Exception.GetType().FullName is' $_.Exception.GetType().FullName
    write-host '$_.Exception.Message is' $_.Exception.Message
}
 
if ((Test-Path "c:\Program Files (x86)\Java") -Or (Test-Path "c:\Program Files\Java")) {
    Write-Host 'Java installed successfully.'
}
Write-Host 'Setting up Path variables.'
[System.Environment]::SetEnvironmentVariable("JAVA_HOME", "c:\Program Files\Java\jdk$JDK_PATH", "Machine")
[System.Environment]::SetEnvironmentVariable("PATH", $Env:Path + ";c:\Program Files\Java\jdk$JDK_PATH\bin", "Machine")
Write-Host 'Done. Goodbye.'
