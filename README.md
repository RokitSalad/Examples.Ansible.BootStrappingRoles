# Examples.Ansible.BootStrappingRoles
An example of how to bootstrap Ansible roles from a bash file.

## About
This repo is an attempt to demonstrate in a simple yet effective fashion, how an Ansible play can reference roles. 

This isn't an exhaustive example, it simply shows an easy way to get started. It also ignores various features, such as variables, and nested role dependencies.

## Prerequisites
To use this, you'll need [Vagrant](https://www.vagrantup.com/intro/getting-started/) installed. The [Vagrantfile](Vagrantfile) in this repo is configured for HyperV, if you are not on Windows or don't have HyperV enabled, you may have to use a different base image and tweak the settings.

## Why?
It is my experience that developers with a working knowledge of any particular configuration management platform are hard to come by. I wanted to show how straight forward Ansible can be.

## How?
Run this with the usual:
```
vagrant up
```
What you'll see is the result of Vagrant running [bootstrap.sh](bootstrap.sh). The bootstrap bash script uses the [requirements.yml](playbook/requirements.yml) and [test_play.yml](playbook/test_play.yml) to configure the instance. This is an Ansible play, executed by Ansible (already installed on the instance).

## What's happening?
Ansible doesn't force you to use a [requirements.yml](playbook/requirements.yml) file, but in my opinion, it gives a consistent file to hit when bootstrapping roles. This [requirements.yml](playbook/requirements.yml) simply states that the play depends on the role 
```
nginxinc.nginx
```
and gives this role the name 'local.nginx'. When you run this play, you'll see the role appear in the Ansible\roles folder, because the [Vagrantfile](Vagrantfile) has shared that folder with the virtual machine.

The [requirements.yml](playbook/requirements.yml) only pulls down the roles, it doesn't execute them. Although if any roles are dependent on other roles, it will pull them down as well.

> *It's possible to reference roles from your own git repositories, whether they're public or private. Simply follow the syntax [here](https://galaxy.ansible.com/docs/using/installing.html#installing-multiple-roles-from-a-file).*

Once you've downloaded the roles with a call to ansible-galaxy (see [bootstrap.sh](bootstrap.sh)) which then also runs your playbook, in this case [test_play.yml](playbook/test_play.yml).

> *Notice how I've renamed the role when installing it and referred to it in my playbook by the new name. This is just to highlight that it's possible.*

It's the playbook and [bootstrap.sh](bootstrap.sh) which is going to be your primary output from this exercise, as these give you a package for bootstrapping your application in any instance using Ansible.