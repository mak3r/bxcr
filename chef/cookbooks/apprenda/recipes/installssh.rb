chocolatey_package 'openssh' do
  action :install
  options '-params "/SSHServerFeature"'
end