# Teamboard

## Setup

This is a guide how to setup Contriboard development environment by using Vagrant-tool. [Vagnrant](https://www.vagrantup.com/) provides fast and conviniet way to deploy a development enviroment without extra work  


0. Setting up git, vagrant and downloading files

As you see this is fast guide! We assume you can do some steps without extra guidance..

  * Install Git client, vagrant, virtualbox and other needed librarys for you host machine.
  * Open shell/console and try out "vagrant" command! (In windows you should use gitbash as console)
  * Create a brand new folder in your host machine. This is place where all files are stored during development.
  * Download teamboard-repository files as zip package to the your new folder (Download zip)
  * Extract files and now you are ready to progress!
  




1. Initialize the workspace by running a initialization commands:


        If you have ssh access and account to github use command 


	```
	sh initialize_ssh.sh <your name>
	```
        If you want to clone repositorys using https you should use command
        
        ```
	sh initialize_https.sh <your name>
	```



	This will clone the teamboard components into their respecting repositories.

2. Create a machine to develop on:

	2.1 Make sure the box image is correct: 
	
	If you're not running a 64bit system, open vagrantfile and look for line:
	```
	config.vm.box = "ubuntu/trusty64"
	```
	Change trusty64 to trusty32 and save. This line defines the base system image 
	used for the virtual machine
	
	
	2.2 Create the machine:
	
	```
	vagrant up
	```
	This will spawn a headless virtual machine configured with the tools needed
	for development. You just supply the editor of your choosing.


	2.3 Adding a box manually:
	
	If the box cannot be downloaded automatically, you might have to download and 
	add it manually. You can either take the link from the error message, or find 
	and download the correct box from here:
	```
	https://atlas.hashicorp.com/ubuntu
	```
	You can add the box into vagrant by typing:
	```
	vagrant box add <file path> --name <name for the box>
	```
	Just remember to escape backslashes with \ => \\ or the path won't work.
	Update the name of the added box into your vagrantfile and run vagrant up again.
	
	
3. Start building, running and testing the code
	```
	vagrant ssh
	```
	This will drop you into the shell of the machine you created above.

## Running

The repositories cloned by running the `initialize.sh` script are the actual
`teamboard` components that we will be developing. These repositories will be
mounted to the home folder of the virtual machine we just created.

For instructions on how to run each component, refer to their individual
repositories.

## Workflow

Use version control and the editor of your choosing on your host machine.

Run, build and test the code on the machine we created by running the `vagrant`
commands. Vagrant will sync the repositories cloned by running `initialize.sh`
into the machine we created, so any changes made to those on your host machine
will reflect on the created machine.
