chocolatey_package 'dotnet3.5' do
  action :install
  timeout 1200
end

chocolatey_package 'dotnet4.5' do
  action :install
end