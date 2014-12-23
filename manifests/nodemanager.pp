# == Class: weblogic::nodemanager
#
# Wrapper around biemond-orawls::nodemanager. Creates and starts
# the nodemanager for WebLogic domains.
#
# === Parameters
#
# === Variables
#
# === Examples
#
#  class { 'weblogic::nodemanager': }
#
# in hiera:
#
# # create and startup the nodemanager
# nodemanager_instances:
#   'nodemanager':
#     log_output:                            *logoutput
#     custom_identity:                       false
#     nodemanager_address:                   *domain_adminserver_address
#
# === Authors
#
# @Author: pde
# @Date:   2014-12-23 05:17:48
# @Last Modified by:   pde
# @Last Modified time: 2014-12-23 07:59:23
#
# === Copyright
#
# Copyright 2015 Above Property LLC, unless otherwise noted.
#
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
