# Introduction

A virtual setup for the Coursera Web Intelligence and Big Data course. Right now it's one worker server and one server, uh, server.

## Requirements

* A computer with a decent amount of memory. Right now this setup runs two virtual machines with the default amount of RAM (384MB). It might change.
* Oracle VirtualBox
* A Ruby interpreter

## Installation

Install [Vagrant](http://vagrantup.com/v1/docs/getting-started/index.html). No need to follow the _Your First Vagrant Virtual Environment_ part though.

Clone this repo: `git clone git@github.com:swalberg/web_intelligence.git`. You can also fork it which will let you commit your work back to GitHub.

Change into the directory: `cd web_intelligence`

Run `vagrant up` to install and provision the two VMs

## Running a job

Work on your job in this directory. Everything in this directory is exported to the servers

You'll need two terminal windows to do this. In the first window, start the server by passing it the name of your file:

`vagrant run triangular.py`

In another window, run the client:

`vagrant client`

## Bugs, help, etc

I can't guarantee any help. I can't even guarantee I'll finish the course :P The forums are your best bet.
