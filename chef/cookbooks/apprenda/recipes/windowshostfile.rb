loadmanagerip = "172.16.0.10"

powershell_script "Update windows hostfile" do
    code <<-EOH

    $hostsPath = "C:\\Windows\\System32\\drivers\\etc\\hosts"

    Add-Content $hostsPath "`n#{loadmanagerip}`tapprenda.bxcr"
    Add-Content $hostsPath "`n#{loadmanagerip}`tapps.apprenda.bxcr"
    Add-Content $hostsPath "`n#{loadmanagerip}`twww.apprenda.bxcr"
    Add-Content $hostsPath "`n#{loadmanagerip}`tapi.apprenda.bxcr"

    exit 0
    EOH
end
