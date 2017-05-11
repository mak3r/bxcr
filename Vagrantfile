Vagrant.configure(2) do |config|
  config.hostmanager.enabled = true
  config.hostmanager.manage_guest = true

  config.vm.define "apprenda-windows" do |node|
    node.vm.box = 'opentable/win-2012r2-standard-amd64-nocm'
    node.vm.communicator = 'winrm'
    node.winrm.transport = 'plaintext'
    node.winrm.basic_auth_only = true
    node.vm.network 'forwarded_port', host: 33199, guest: 3389
    node.vm.network 'private_network', ip: '172.16.0.10'
    node.vm.hostname = 'apprwin'
    node.vm.provider :virtualbox do |vb|
      vb.name = 'apprwin'
      vb.gui = false
      vb.memory = 4096
    end

    node.vm.provision 'chef_solo' do |chef|
      chef.version = '12.19.33'
      chef.cookbooks_path = ['chef/berks-cookbooks', 'chef/cookbooks']
      chef.json = {
        'sql_server' => {
          'accept_eula' => true,
          'server_sa_password' => 'bxcr@dm!Npaas',
          'version' => '2012',
          'instance_name' => 'MSSQLSERVER',
          'update_enabled' => false
        }
      }
      chef.add_recipe "sql_server::server"
      chef.add_recipe "apprenda::setup"
    end
    node.vm.provision 'shell', path: "./ps/Configure-SQL.ps1"
  end

  config.vm.define "apprenda-linux" do |node|
    node.vm.box = 'bento/centos-7.3'
    node.vm.hostname = 'apprlin'
    node.vm.network 'private_network', ip: '172.16.0.11'
    node.vm.provider :virtualbox do |vb|
      vb.name = 'apprlin'
      vb.memory = 2048
    end

    node.vm.provision 'chef_solo' do |chef|
      chef.channel = '12.19.33'
      chef.cookbooks_path = ['chef/berks-cookbooks', 'chef/cookbooks']
      chef.json = {
        'apprenda_linux' => {
          'hostname' => 'apprlin',
          'loadmanagerip' => '172.16.0.10',
          'loadmanagerhostname' => 'apprwin'
        }
      }
      chef.add_recipe "apprenda_linux::centos7"
    end
  end
end