# Contriboard development environment setup using Vagrant

## About Guide

This is a guide how to setup Contriboard development environment by using Vagrant-tool. [Vagrant](https://www.vagrantup.com/) provides fast and convinient way to deploy a development enviroment without extra work

## 1. Set up git, vagrant and download files

As you see this is fast guide! We assume you can do some steps without extra guidance..

  * Install Git client, vagrant, virtualbox and other needed librarys for you host machine.
  * Open shell/console and try out "vagrant" command! (In windows you should use gitbash as console)
  * Create a brand new folder in your host machine. This is place where all files are stored during development.
  * Clone teamboard-repository to your new folder.

Now you are ready to initialize workspace for Contriboard!



## 2. Initialize the workspace

Initialize the workspace by running a initialization commands according you environment:

Open console or terminal (in windows you should use git bash, because of shell script (sh)).


If you can use direct ssh access and account to github use command:

```
sh initialize_ssh.sh <your name>
```

If you want to clone repositorys using https you should use command:

```
sh initialize_https.sh <your name>
```

If you have still problems you should try to do just a clone!

```
sh initialize_https.sh
```

This will clone the teamboard components into their respecting repositories.


## 3. Create a machine to develop on:

Make sure the box image is correct:

If you're not running a 64bit system, open vagrantfile and look for line:

```
config.vm.box = "ubuntu/trusty64"
```
Change trusty64 to trusty32 and save. This line defines the base system image
used for the virtual machine


### Create the machine:

Now you start to create vagrant machine according configuration settings in vagrantfile [read more](https://docs.vagrantup.com/v2/vagrantfile/). You should now give a command in your workspace:


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

During initialization all needed repositories are cloned in your host machine folders. In production environment deployment and service startup is handled little bit differently than in development environment.


Service Starting order: API, IO, Client

### Starting api & io

At first you have to start up teamboard-api and teamboard-io services
Change you working directory to the service specific folder eg. teamboard-api or teamboard-io
All server side components are written using Node.js, so we have to use some node specific commands.

```
npm install
```

By running this command Node package manager will build and deploy service components.


WINDOWS USER!!! There is some issues with symlinks in windows host when using vagrant. This means you have to install all packages using some extra parameters:

```
npm install —no-bin-links
```

After succesfull build you can now start a service by using command


```
npm start &
```



We are starting up service as background process (&) [read more](http://stackoverflow.com/questions/4797050/how-to-run-process-as-background-and-never-die) , so you are able to use same console session to start another services. So you shoudl now do same process with another service component! . It would be more conviniet to run all services in own consoles.

### Starting the new client (Windows)
```
npm install && gulp
```
This will start a development server. If you are using Windows, use the
`--no-bin-links` option with `npm install`. Alternatively don't use Windows.

After the service is start, you should be able to see what port the service is
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

### Starting up teamboard-client service and login to contriboard

There is curretly some problems with this repository.  Currently you cannot start client-service without problems! We will fix it asap!

WINDOWS user! There is some issues with current implementation of library dependencies, so Windows version of Vagrant users cannot currently develop client side.

![](https://openclipart.org/image/256px/svg_to_png/3850/dchandlr-dchandlr-work.png)

When the things are in order you can start client service.


```
npm install —no-bin-links bower

sudo npm install -g gulp

gulp build

```

Because of using vagrant environment our service will be mapped to localhost network:

Port 80 (http) will be visible at:

http://localhost:8080





## 7. Development Workflow

Use version control and the editor of your choosing on your host machine.

Run, build and test the code on the machine we created by running the `vagrant`
commands. Vagrant will sync the repositories cloned by running `initialize.sh`
into the machine we created, so any changes made to those on your host machine
will reflect on the created machine.
