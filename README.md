# bxcr-bamboobxcr bamboo is a vagrant/chef setup for a CI/CD demo using Atlassian Bamboo. It can be easily used in conjunction with the Apprenda [bxcr](http://github.com/apprenda/bxcr) environment. This is a fork of the original  [bxcr](http://github.com/apprenda/bxcr) with the addition of the bamboo box. The original documentation for  [bxcr](http://github.com/apprenda/bxcr) has been moved to another [readme](./bxcr_orig.md)This demo can also be done with any Apprenda environment. The steps for setting up the bamboo agent will change according to the environment you are targeting.In addition to using this environment for demoing CI/CD, it can be used as a development environment for the [Apprenda bamboo plugin](http://bitbucket.org/apprendaclientservices/apprenda-bamboo)## Prerequisites##### Automation #####These are the versions this has been tested on, but it _should_ work with any recent version of Vagrant and VirtualBox* Vagrant 1.9.6* VirtualBox 5.1.22##### System Capacity #####* You should have at least *4 GB* of RAM available to run the bxcr-bamboo box. bxcr itself will need additional RAM. * At least 80GB of available disk space. The .net build agent requires visual studio to be installed.##### Private repository access: ######* [apprenda-bamboo](http://bitbucket.org/apprendaclientservices/apprenda-bamboo) can be used to invoke the bamboo server with the Apprenda plugin automatically enabled.* The Apprenda [powershell](http://bitbucket.org/apprendaclientservices/powershell) module can be useful for automating other Apprenda related deployment semantics## Usage ##### Provision the VM ###1. Clone this repository.2. Run `vagrant up` from the root of the code checkout. If this is your first time running it, it may take some time as Vagrant must pull a few gigabytes of base images. 3. To also run bxcr, run `vagrant up apprenda-windows`. 4. Follow the [bxcr readme](./bxcr_orig.md) to leverage Linux nodes.5. Add entries to your system hosts file to enable you to access the VM by name:  ```172.16.0.13     apprbmb.apprenda.local```### Preparing the Agent/Server ###RDP into the server using `vagrant rdp`. Both the machine username and password is `vagrant`. The following steps will help you get bamboo setup as a build server and build agent#### Install build agents tools for java and .net ######### Visual Studio #####1. Mount the secondary drive through virtual box UI2. Download and install visual studio into the secondary drive `D:`##### Gradle for Java #####1. install the scoop package manager 	* Open powershell	* `iex (new-object net.webclient).downloadstring('https://get.scoop.sh')`	* `scoop install gradle`A similar process might apply to ant or other java build tools#### Start the bamboo server ####7. Open a cmd window and cd to the apprenda-bamboo repository8. Run the command `atlas-run -p 8085`. If you change the port number of course the port of access will change also.9. Log on to your bamboo server with the server name and port of access at `https://apprbmb:8085/bamboo`. The default account is `admin` with a password of `admin`.## Notes* "Why did Chef randomly fail to install something on Windows?" Let us know the details, but you can generally re-run the provisioning step with `vagrant provision` to retry.* To avoid your browser complaining about no trust, you can install `/certs/root.cer` into your system store.* For information on how to use Apprenda, please see our documentation at https://docs.apprenda.com. * Information on using Vagrant can be found at https://www.vagrantup.com/docs/index.html.* You can SSH to either the Windows or Linux machine by using `vagrant ssh` and the machine name, for example, `vagrant ssh apprenda-windows` or `vagrant ssh apprenda-linux`. For a graphical session, you can `vagrant rdp apprenda-windows`. The machine username and password for both nodes is `vagrant`.## Questions or Problems?Please file a bitbucket issue for any questions you may have, or problems you encounter using `bxcr-bamboo`.## ContributingWe gladly accept pull requests! Requests will be reviewed by our team. In particular we are looking for removing manual steps which can be automated as part of the vagrant provisioning process.