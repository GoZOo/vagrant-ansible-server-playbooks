# Vagrant Ansible LAMP env.

This is a simple recipe for *vagrant* that sets up an Ubuntu virtual machine including common daemons and tools required for PHP web development.

This project aims to make spinning up a simple development environment and avoid loosing time creating virtual machines.

Differences with others vagrant built for Drupal is:

- Configuration is simple
- You can host and create as many projects you want on one VM with multiple virtualhosts. You don't neet to launch multiple VM and vagrants. I'm working on OSX and VMs have a cost, so working with only one VM for all lamp env make me gain time.

All the provisioning is done with `Ansible`.

NFS is used to share files between VM (for apache, php etc) and your local machine (for your IDE). Source code is based in your local machine.

## LAMP environnement

This project is designed to install all needed for web developpement on a LAMP architecture and works well with Drupal.
It will install the following on an Ubuntu 14.04 linux VM:

- Apache 2.4.x + SSL
- PHP 5.5.x
- MySQL 5.5.x
- Composer
- Git
- Xdebug
- Varnish 4.1 available at http://33.33.33.20:6091

In addition to these softwares, you can install:

- Drush

## Other environnements

The repository hosts several development environnements you can access in the other branches. Each of them are designed to answer to specific needs.

- [ubuntu-14.04-Lamp-goz](https://github.com/JulienD/vagrant-ansible-server-playbooks/tree/ubuntu-14.04-lamp-goz) : My own configuration
- [ubuntu-14.04-Lamp-dev](https://github.com/JulienD/vagrant-ansible-server-playbooks/tree/ubuntu-14.04-lamp-dev) : Configuration from JulienD Fork
- [ubuntu-14.04-Nodejs-dev](https://github.com/JulienD/vagrant-ansible-server-playbooks/tree/ubuntu-14.04-nodejs-dev) : Configuration for NodeJS
- [ubuntu-14.04-Golang-dev](https://github.com/JulienD/vagrant-ansible-server-playbooks/tree/ubuntu-14.04-go-dev) : Configuration for Golang


## Requirements

- [VirtualBox](https://www.virtualbox.org/)
- [Vagrant](http://www.vagrantup.com/)
- [Ansible](http://docs.ansible.com/intro_installation.html#getting-ansible)

Preferably in their latest versions from the web sites.

## Getting started

Clone this repository to a local directory and change the name of it:

    git clone https://github.com/GoZOo/vagrant-ansible-server-playbooks.git lamp-dev-env

You should install vbguest to use vboxsf:

    vagrant plugin install vagrant-vbguest

Go into the directory and run:

    vagrant up

This should download, run and provision the virtual machine.

If something goes wrong, have a look at `provisioning/playbook.yml`. You can re-provision the VM using at any moment when you change the configuration:

    vagrant provision

When you're done playing with the VM, you can delete it:

    vagrant destroy

## Customize the installation

### Source code directory

You can configure your own synced_folder in Vagrantfile.

Replace `"data"` in `config.vm.synced_folder "data"` by your own relative or absolute directory where source code of all your projects is.

### Tags

Ansible tags are used to manage and group sets of actions. This mean you can choose to add specific actions in addition to the default provisioning your Vagrantfile.

    config.vm.provision "ansible" do |ansible|
      ansible.playbook = "provisioning/playbook.yml"
      ansible.tags="common,drush"
    end

In the above example, in addition to the common package, all the action in the recipe tagged with the drush tag will be executed.

For more details have a look at the file `provisioning/playbook.yml` and look for the `tags` property.

#### Available tags

- common
- composer
- drush

### Easily create your virtualhosts and database

In configuration.yml file, you can create as many virtualhost and database as you want.
Once you edit this file, reload vagrant provisionning and don't forget to add domain in your local /etc/hosts.

## Why not respecting Ansible best practices

For months I've been using the classical Ansible structure management by having a separated dir for each components. This structure work really fine and is useful for sys-admin when they have to manage and maintain a lot of component, but for a local dev machine it's too much (this is my point of view).

I decided to rewrite all my development machines recipes in a flattern file way where everything is accessible at the first glance and doesn't require to navigate in dozens of sub-folders and file. KISS

## Todo

Here is a list of things I have to do to finish this env.
- SolR (in option)
