# == Class: weblogic::node
#
# This class instantiates a WebLogic node (non-adminserver) instance
# and copies the appropriate domain from the admin server. See
# doc/hiera_samples/node1.yaml for example values.
#
# === Parameters
#
# === Variables
#
# === Examples
#
#  class { 'weblogic::node':}
#
# === Authors
#
# @Author: pde
# @Date:   2014-12-23 05:17:55
# @Last Modified by:   pde
# @Last Modified time: 2014-12-23 08:02:15
#
# === Copyright
#
# Copyright 2015 Above Property LLC, unless otherwise noted.
#
class weblogic::node {

  include weblogic::os
  include weblogic::ssh
  include weblogic::java
  include orawls::weblogic
  include orautils
  include weblogic::bsu
  include weblogic::copydomain
  include weblogic::nodemanager

  Class[weblogic::os] -> Class['weblogic::java'] -> Class['orawls::weblogic']
}
