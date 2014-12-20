## Synopsis

A puppet module for installing WebLogic and all its prerequisites and
configuring WebLogic domains.

## Code Example

A typical use case looks for an admin node looks like this:

```
node 'admin' {

  class {'weblogic::admin':}

}
```

And a managed server node:

```
node 'node1' {

  class {'weblogic::node':}

}
```

See manifests/admin.pp and manifests/node.pp for how these expand. Each class has its
set of dependencies expicitly called within the class file, making this module very clean
to instantiate. All variables should be set in hiera; see hieradata/ for examples. Note
that one should likely modify hiera.yaml and add a domain specific hierarchy, so we could
have:

```
hostname
wlsdomain
environment
common
```

Making it possible to set up, for example, the admin server for the pms domain in the
g6test environment without interfering with othere servers, domains, and environments.


## Motivation

Weblogic is a large and complicated application delivery system with
substantial touch points required to configure. This process has typically
taken many days to complete when done by hand. This module leverages several
prewritten puppet modules for common tasks (installing java, creating users &
groups, installing the weblogic base software itself), and then applies 
SkyTouch standard tooling to automate the entire process.

## Requirements

This module requires the puppet forge module biemond-orawls and all of its
dependencies

## Installation

Install this module into /etc/puppetlabs/puppet/modules (Puppet Enterprise) or
/etc/puppet/modules (puppet open source) on your puppet master. The module
mostly relies on hiera for configuration, and a sample .yaml should be
included with the source code. Modify the yaml as appropriate for the target
server and weblogic domain.

## Tests

No tests written so far.

## Contributors

Pete Ehlke <pete.ehlke@aboveproperty.com>: Initial author

