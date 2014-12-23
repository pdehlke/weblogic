# == Class: weblogic::ssh
#
# Sets up $wls_os_user ssh keys for passwordless authentication between
# machines in a WebLogic cluster. Necessary for weblogic::copydomain to
# function. This class shoudl be refactored, with owner, group, and
# home directory coming from hiera.
#
# === Parameters
#
# === Variables
#
# === Examples
#
#  class { 'weblogic::ssh':}
#
# === Authors
#
# @Author: pde
# @Date:   2014-12-23 05:17:48
# @Last Modified by:   pde
# @Last Modified time: 2014-12-23 06:39:41
#
# === Copyright
#
# Copyright 2015 Above Property LLC, unless otherwise noted.
#
class weblogic::ssh {
  require os


  file { "/home/weblogic/.ssh/":
    owner  => "weblogic",
    group  => "weblogic",
    mode   => "700",
    ensure => "directory",
    alias  => "weblogic-ssh-dir",
  }

  file { "/home/weblogic/.ssh/id_rsa.pub":
    ensure  => present,
    owner   => "weblogic",
    group   => "weblogic",
    mode    => "644",
    source  => "puppet:///modules/weblogic/id_rsa.pub",
    require => File["weblogic-ssh-dir"],
  }

  file { "/home/weblogic/.ssh/id_rsa":
    ensure  => present,
    owner   => "weblogic",
    group   => "weblogic",
    mode    => "600",
    source  => "puppet:///modules/weblogic/id_rsa",
    require => File["weblogic-ssh-dir"],
  }

  file { "/home/weblogic/.ssh/authorized_keys":
    ensure  => present,
    owner   => "weblogic",
    group   => "weblogic",
    mode    => "644",
    source  => "puppet:///modules/weblogic/id_rsa.pub",
    require => File["weblogic-ssh-dir"],
  }
 }
