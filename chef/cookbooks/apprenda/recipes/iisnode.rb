powershell_script "install iisnode" do
  code <<-EOH
  Write-Host Downloading IISNode...
  mkdir c:\\tmp\\
  Invoke-WebRequest -Uri https://github.com/tjanczuk/iisnode/releases/download/v0.2.11/iisnode-full-v0.2.11-x64.msi -OutFile C:\\tmp\\IISNode.msi

  Write-Host Installing IISNode...
  $command = 'msiexec /i C:\\tmp\\IISNode.msi /quiet /qn'
  Invoke-Expression -Command:$command
  Write-Host Finished installing IISNode.


  exit 0
  EOH
end
