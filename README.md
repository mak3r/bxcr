# bxcr

bxcr is a small, single windows node that can be brought up using Vagrant with all of the pre-requisites needed to install Apprenda Cloud Platform.

## Prerequisites

These are the versions this has been tested on, but it _should_ work with any recent version of Vagrant and VirtualBox
* Vagrant 1.9.2 (with Vagrant Hostmanager Plugin via `vagrant plugin install vagrant-hostmanager`)
* VirtualBox 5.1.22
* ChefDK (for `berks`)

## Usage
1. Clone this repository. You'll also need to get an Apprenda Cloud Platform install package. Place the install package into the checkout (so it's available on the VM).
2. From the `chef` directory of the checkout, run `berks vendor`.
3. Run `vagrant up` from the root of the code checkout. If this is your first time running it, it may take some time as Vagrant must pull a few gigabytes of base images.
4. After `vagrant up` has completed, you can remote into the machine and run the Apprenda Cloud Platform installer via command line with the following arguments to use our default install template:  
```C:\vagrant\<ACP package>\Installer\Apprenda.Wizard.exe install -i C:\vagrant\<ACP Package>\installTemplate.xml -autoRepair```
5. Add an entry to your system hosts file to enable you to access the VM by name:  
```172.16.0.10     apprenda.bxcr```
6. Log on to your new instance at `https://apps.apprenda.bxcr`. The default account is `admin@bxcr.apprenda` with a password of `password`.