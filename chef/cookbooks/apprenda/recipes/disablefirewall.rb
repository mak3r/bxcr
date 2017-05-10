powershell_script "disable windows firewall" do
  code <<-EOH
  Set-NetFirewallProfile -Profile Domain,Public,Private -Enabled False
  exit 0
  EOH
end
