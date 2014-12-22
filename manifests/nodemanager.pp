# == Class: class_name
#
# Full description of class example_class here.
#
# === Parameters
#
# Document parameters here.
#
# [*ntp_servers*]
#   Explanation of what this parameter affects and what it defaults to.
#   e.g. "Specify one or more upstream ntp servers as an array."
#
# === Variables
#
# Here you should define a list of variables that this module would require.
#
# [*enc_ntp_servers*]
#   Explanation of how this variable affects the funtion of this class and if it
#   has a default. e.g. "The parameter enc_ntp_servers must be set by the
#   External Node Classifier as a comma separated list of hostnames." (Note,
#   global variables should not be used in preference to class parameters  as of
#   Puppet 2.6.)
#
# === Examples
#
#  class { 'example_class':
#    ntp_servers => [ 'pool.ntp.org', 'ntp.local.company.com' ]
#  }
#
# === Authors
#
# @Author: pde
# @Date:   2014-12-22 07:18:54
#
# === Copyright
#
# Copyright 2015 Above Property LLC unless otherwise noted.
#
# === Metadata
# @Last Modified by:   pde
# @Last Modified time: 2014-12-22 07:55:33

class weblogic::nodemanager {
  require orawls::weblogic, weblogic::domains

  $default_params = {}
  $nodemanager_instances = hiera('nodemanager_instances', {})
  create_resources('orawls::nodemanager',$nodemanager_instances, $default_params)

  orautils::nodemanagerautostart{"autostart weblogic 11g":
    version                 => hiera('wls_version'),
    wlHome                  => hiera('wls_weblogic_home_dir'),
    user                    => hiera('wls_os_user'),
    jsseEnabled             => hiera('wls_jsse_enabled'             ,false),
    customTrust             => hiera('wls_custom_trust'             ,false),
    trustKeystoreFile       => hiera('wls_trust_keystore_file'      ,undef),
    trustKeystorePassphrase => hiera('wls_trust_keystore_passphrase',undef),
  }

 }
