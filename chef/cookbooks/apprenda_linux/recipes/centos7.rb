hostname            = node["apprenda_linux"]["hostname"]
loadmanagerip       = node["apprenda_linux"]["loadmanagerip"]
loadmanagerhostname = node["apprenda_linux"]["loadmanagerhostname"]

bash 'init' do
  code <<-EOH
      sudo yum install -y libcgroup libcgroup-tools iptables-services cifs-utils unzip openssh-clients autofs
      sudo service cgconfig start

      sudo sed -i '1d' /etc/hosts

      sudo printf '#{loadmanagerip}\tapprenda.bxcr\n#{loadmanagerip}\tapps.apprenda.bxcr\n#{loadmanagerip}\twww.apprenda.bxcr\n#{loadmanagerip}\tapi.apprenda.bxcr\n' >> /etc/hosts
      sudo mkdir -p /apprenda/repo/sys /apprenda/repo/apps
      sudo printf '/- /etc/auto.apprenda' | sudo tee /etc/auto.master
      sudo touch /etc/auto.apprenda
	    sudo printf '/apprenda/repo/apps -fstype=cifs,rw,user=vagrant,pass=vagrant,vers=2.1 ://#{loadmanagerhostname}/Applications\n' | sudo tee -a /etc/auto.apprenda
	    sudo printf '/apprenda/repo/sys  -fstype=cifs,rw,user=vagrant,pass=vagrant,vers=2.1 ://#{loadmanagerhostname}/Apprenda' | sudo tee -a /etc/auto.apprenda
      sudo service autofs restart
	    sudo chkconfig autofs on
      sudo chkconfig cgconfig on

      EOH
end
