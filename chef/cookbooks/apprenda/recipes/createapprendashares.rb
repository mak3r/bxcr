powershell_script "Create Apprenda share paths" do
    code <<-EOH
		
	$destSysDir = "C:/Partitions/Apprenda"
	$destAppsDir = "C:/Partitions/Applications"
	
	# If folder doesn't exist create it, if exists don't overwrite it
	Write-Host "Creating Apprenda Partition mount destinations"
	New-Item -Path $destSysDir -ItemType Directory -Force | Out-Null
	New-Item -Path $destAppsDir -ItemType Directory -Force | Out-Null
	Write-Host "Finished creating Apprenda Partition mount destinations"

	# Share if not already shared
	Write-Host "Sharing Apprenda Partition mount destinations"
	if(!(Get-SMBShare -Name Apprenda -ea 0)){
		New-SmbShare -Name "Apprenda" -Path $destSysDir -FullAccess Everyone
	}
	if(!(Get-SMBShare -Name Applications -ea 0)){
		New-SmbShare -Name "Applications" -Path $destAppsDir -FullAccess Everyone
	}
	Write-Host "Finished sharing Apprenda Partition mount destinations"

	exit 0
    EOH

end