# Rails Crash Course - Women Who Code Cincinnati

Saturday, Feburary 20, 2016, 10:00 am - 2:00 pm &mdash; [RSVP on Meetup](http://www.meetup.com/WWCode-Cincinnati/events/227681945/)

(optional) Friday, February 19th, 7:45 am - 9:30 am &mdash; Help with
installing Ruby @
[Gaslight Coffee Hour](http://www.meetup.com/Gaslight-Coffee-Weekly-Open-House/)

## Table of Contents

* [What to Bring](#what-to-bring)
* [Before You Arrive](#before-you-arrive)
  * [Installing Ruby](#installing-ruby)
  * [Installing Bundler](#installing-bundler)
  * [Installing Rails](#installing-rails)
* [Class Resources](#class-resources)
* [After the Class](#after-the-class)

## What to Bring

* A computer with a Ruby on Rails environment (Can you run `irb --version` and
  `rails --version` from the command line?)
* Basic command line skills (Can you navigate around folders?)
* Your favorite code editor that supports Ruby ([Atom](https://atom.io/) is a
free option)

## Before You Arrive

Before you arrive, you should have a Ruby environment installed on your
computer. It would also be advantageous to install Rails and Bundler as they
typically take a long time to download and install.

### Installing Ruby

#### Installing Ruby on Your Machine

This is the most straightforward guide that I found on installing Rails. There are instructions for both OSX and Ubuntu. Windows users should try one of the other solutions listed below.

https://gorails.com/setup/osx/10.11-el-capitan

* Skip these sections
  * Configuring Git - We will not be using Git during this session. If you are
  interested in setting up Git, check out guides from Github which are more
  user friendly.
  * Setting Up a Database - We are fine using the sqlite database for this
  session. If you want to continue on with Rails, consider using PostgreSQL.

#### Docker Environments

You can use Docker to help keep your environment clean and setup easy. I have not personally tried this yet but it should work nicely. It may be easier than installing Ruby on your machine.

https://docs.docker.com/engine/installation/windows/

https://hub.docker.com/_/rails/

#### Cloud-based Ruby Environments

There are some cloud-based environments that won't require anything to be installed on your computer. This is probably the best option for Windows developers. These environments will already have Rails and Bundler installed, so you will not have to worry about installing additional dependencies. However, you should try to have an account created before coming to the workshop and familiarize yourself with the environment.

• https://c9.io/

• https://www.nitrous.io/

### Installing Bundler

(Bundler)[http://bundler.io/] is used almost universally in Ruby projects to
manage project-specific gems. This is like installing packages locally in Node,
so you can have different versions of the same library on your machine at one
time. To install bundler, use the command

`gem install bundler`


Once installation is complete, if you are using rbenv don't forget to run

`rbenv rehash`

This makes rbenv look for any gems you have recently installed, and makes them
available to run from the command line.

Once that is complete, run the command

`bundle install --binstubs`

This will create files in your `bin` folder that will properly scope bundled
commands to your locally installed gems.

### Installing Rails

To install Rails, use the following command:

`gem install rails`

This will install the latest version of Rails globally. This can take several
minutes, as it must download a fair amount of source code and compile certain
C++ modules.

Again, if you are using rbenv don't forget to run

`rbenv rehash`

You need to install Rails globally to be able to generate new projects. A local
version will be installed in the generated project, to allow for different
Rails versions to be used locally.

## Class Resources

* [Slides](https://rawgit.com/CincyWWC/rails-crash-course/master/slides.html)
* [Cheat Sheet](https://rawgit.com/CincyWWC/rails-crash-course/master/cheat-sheet.html)

## After the Class

TODO
