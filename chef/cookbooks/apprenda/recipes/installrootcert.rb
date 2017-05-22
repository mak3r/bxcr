powershell_script "install root cert" do
  code <<-EOH
  Import-Certificate -FilePath "C:\\Users\\vagrant\\root.cer" -CertStoreLocation Cert:\\LocalMachine\\Root
  EOH
end
