## Synopsis

A puppet module for installing WebLogic and all its prerequisites and
configuring WebLogic domains.

## Code Example

A typical use case looks for a single node looks like this:

```
node 'weblogic1' {

  Class[weblogic::java] -> Class[orawls::weblogic]

  class {'weblogic::os':}
  class {'weblogic::java':}
  class {'orawls::weblogic':}
  class {'weblogic::domain':}
  class {'weblogic::nodemanager':}
  class {'weblogic::startwls':}
  class {'weblogic::packdomain':}

}
```

The classes themselves are written wtih explicit dependency callouts, meaning
that we could write that node definition with nothing but the 
'weblogic::packdomain' definition. That's particularly terse, and likely
unhelpful to new users, so we call out each class. Classes are defined
in dependency order for clarity; remember that puppet is not a procedural
language and dependencies must be defined in the classes themselves or in
the node definition (as we do here with the orawls::weblogic <- weblogic::java
declatation)

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

