# bxcr

bxcr is a small Apprenda Cloud Platform environment that can be brought up using Vagrant.

## Prerequisites

These are the versions this has been tested on, but it _should_ work with any recent version of Vagrant and VirtualBox
* Vagrant 1.9.4 (with Vagrant Hostmanager Plugin via `vagrant plugin install vagrant-hostmanager`)
* VirtualBox 5.1.22

## Usage
1. Clone this repository.
2. Run `vagrant up` from the root of the code checkout. If this is your first time running it, it may take some time as Vagrant must pull a few gigabytes of base images.
3. To bring up a Linux node for your grid, run `vagrant up apprenda-linux`.
4. Add entries to your system hosts file to enable you to access the VM by name:  
```
172.16.0.10     apprenda.bxcr
172.16.0.10     www.apprenda.bxcr
172.16.0.10     apps.apprenda.bxcr
```
5. Log on to your new instance at `https://apps.apprenda.bxcr`. The default account is `bxcr@apprenda.com` with a password of `password`.

## Notes

For information on how to use Apprenda, please see our documentation at https://docs.apprenda.com. 
Information on using Vagrant can be found at https://www.vagrantup.com/docs/index.html.

You can SSH to either the Windows or Linux machine by using `vagrant ssh` and the machine name, for example, `vagrant ssh apprenda-windows` or `vagrant ssh apprenda-linux`. For a graphical session, you can `vagrant rdp apprenda-windows`. The machine username and password for both nodes is `vagrant`.