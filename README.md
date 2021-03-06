Virtual environments for machine learning in python
---

With this approach, you guarantee a completely clean environment for running your code: you know exactly how it is setup, and you can rebuild it exactly the way you want with a few simple commands (below).  Your local desktop environment will no longer need to be polluted with random libraries and different versions of various tools.

## Installation

On Windows, install with Chocolatey: https://chocolatey.org/

    choco upgrade -y virtualbox vagrant

On OS X, install with Brew: https://brew.sh/

    brew cask upgrade virtualbox vagrant

Or manually install VirtualBox: https://www.virtualbox.org/wiki/Downloads

Then manually install Vagrant: https://www.vagrantup.com/downloads.html
 (Vagrant is a wrapper around VirtualBox and so requires it)

## Initializing

Copy this repo's files into the directory you want to use for your new project:

    PROJECTDIR=some_new_dir git clone --depth=1 --branch=master git@github.com:rogusdev/machinelearning-virtual.git $PROJECTDIR && rm -rf !$/.git

## Running

Create the virtualbox ("vbox") virtual machine with vagrant:

    vagrant up

Then connect to that vbox vm:

    vagrant ssh

Once ssh-ed into the vbox vm, run the python machine learning app:

    python app.py

Or, inside the vm, build and run the Docker image, if you so desire (the vm already has everything ready, the Docker inside is just in case you prefer that approach):

    docker build -t machinelearning . && docker run machinelearning

## Clean up

When you are done using the VM, leave (with `exit`) then turn it off:

    vagrant halt

Or if you want to start over completely clean, remove it (so you can recreate it as above):

    vagrant destroy

You can confirm its existence and stopped state by opening up VirtualBox and checking it's listed there.
