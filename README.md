# Contriboard development environment setup using Vagrant

## About Guide

This is a guide how to setup Contriboard development environment by using Vagrant-tool. [Vagrant](https://www.vagrantup.com/) provides fast and convenient way to deploy a development environment without the extra work



## 1. Set up git, vagrant and download files

As you can see this is a fast guide! We assume you can do some steps without extra guidance..

  * Install Git client, vagrant, virtualbox and other needed libraries for your host machine.
  * You should install and use latest version of Vagrant from https://www.vagrantup.com/
  * In Linux or Mac environment you can open shell/console and try to execute "vagrant" command! 
  * In Windows system you should use gitbash as console [Google](https://www.google.fi/search?q=gitbash&oq=gitbash&aqs=chrome..69i57.1352j0j4&sourceid=chrome&es_sm=93&ie=UTF-8)
  * Create a new folder in your host machines local folders. Make sure there is enough room for a virtual machine.
  * Change your current folder to the new one (cd new_folder)
  * Your main task is to clone installation scripts in this folder.
  * You can clone a teamboard-repository which contains all that you need.
  * Make sure your git client is installed....

```
git clone https://github.com/N4SJAMK/teamboard
```

  * After clone you should see all files in your local folder
  

## 2. Initialize the workspace



Initialize the workspace by running initialization commands according to your environment:

Files which you just cloned from teamboard repository will be your tools 

Now you have to make sure which way you want to clone current Contriboard edge source code.

  * SSH
  * HTTPS

There are scripts for both methods..

If you can use direct ssh access and account to github use command:

```
sh initialize-ssh.sh <your name>
```

If you want to clone repositories and fork it using https you should use command:

```
sh initialize-https.sh <your name>
```

If you still have problems you should just try cloning a repository!

```
sh initialize-https.sh
```

This will clone the teamboard components into their respective repositories.


## 3. Create a machine to develop on:

Before creating a machine make sure the box image is correct:

If you're not running a 64bit system, open vagrantfile from your teamboard folder and look for the following line:

```
config.vm.box = "ubuntu/trusty64"
```
Change trusty64 to trusty32 and save. This line defines the base system image
used for the virtual machine


### Create the machine:

Now you can start to create vagrant machine according configuration settings in vagrantfile [read more](https://docs.vagrantup.com/v2/vagrantfile/). You should now give a command in your workspace:


```
vagrant up
```

This will spawn a headless virtual machine configured with the tools needed for development. You just supply the editor of your choosing.


### Adding a box manually:

If the box cannot be downloaded automatically, you might have to download and add it manually. You can either take the link from the error message, or find and download the correct box from here:

```
https://atlas.hashicorp.com/ubuntu
```

You can add the box into vagrant by typing:

```
vagrant box add <file path> --name <name for the box>
```

Just remember to escape backslashes with \ => \\ or the path won't work. Update the name of the added box into your vagrantfile and run vagrant up again.


## 4. Start building, running and testing the code

Activate ssh terminal connection to your vagrant virtualmachine by using command:

```
vagrant ssh
```

This will drop you into the shell of the machine you created above.

## 5. Running services

The repositories cloned by running the `initialize.sh` script are the actual
`teamboard` components that we will be developing. These repositories will be
mounted to the home folder of the virtual machine we just created.

For instructions on how to run each component, refer to their individual
repositories.

## 6. Fast guide to start all Contriboad services

During initialization all needed repositories are cloned into your host machine folders. In production environment deployment and service startup is handled a bit differently than in the development environment.


## Service Starting order: 

 * API 
 * IO 
 * Client
 
 
### Starting api & io

At first you have to start up teamboard-api and teamboard-io services
Change your working directory to the service specific folder eg. teamboard-api or teamboard-io
All server side components are written using Node.js, so we have to use some node specific commands.

```
npm install
```

By running this command Node package manager will build and deploy service components.


WINDOWS USER!!! There is some issues with symlinks in windows host when using vagrant. This means you have to install all packages using some extra parameters:

```
npm install --no-bin-links
```

After successful build you can now start a service by using command


```
npm start &
```



We are starting up service as background process (&) [read more](http://stackoverflow.com/questions/4797050/how-to-run-process-as-background-and-never-die) , so you are able to use same console session to start another services. So you should now do the same process with another service component! It would be more convenient to run all services in own consoles.

### Starting the new client (Windows)
```
npm install && gulp
```
This will start a development server. If you are using Windows, use the
`--no-bin-links` option with `npm install`. Alternatively don't use Windows.

After the service has started, you should be able to see what port the service is
running on. If you have configured `vagrant` correctly, you can access the
service at `http://localhost:<PORT>`.

### Starting the new client (Linux)

Under Linux environment the client is started using the same method as when starting api and io components. At first, in client directory, run command
```
npm install
```
then

```
npm start &
```
and finally, run command

```
gulp
```


Because of using vagrant environment our service will be mapped to localhost network:

Port 8000 (http) will be visible at:

http://localhost:8000 or http://0.0.0.0:8000

In some cases

http://127.0.0.1:8000


###Starting Contriboard using script (automatic)

In your teamboard repository run start scipts. 

Start Contriboard services (API and IO)
```
sh start_services.sh
```

Start Contriboard client
```
sh start_client.sh
```

## 7. Development Workflow

Use version control and the editor of your choosing on your host machine.

Run, build and test the code on the machine we created by running the `vagrant`
commands. Vagrant will sync the repositories cloned by running `initialize.sh`
into the machine we created, so any changes made to those on your host machine
will reflect on the created machine.


## Questions and Answers ?

Q: Why you are talking about Contriboard, but there is so many repositories with name Teamboard! I dont't get it!!
A: Yes teamboard was a old name of Contriboard and transformation is long trip.... it's progressing...

Q: I got lot of error messages in my Windows setup ?
A: Did you remember to add parameter --no-bin-links when execution of npm commands?



