# == Class: weblogic::userconfig
#
# Wrapper around biemond-orawls::storeuserconfig
#
# === Parameters
#
# === Variables
#
# === Examples
#
#  class { 'weblogic::userconfig':}
#
# in hiera:
#
# userconfig_instances:
#   'Wls12c':
#      log_output:           *logoutput
#      user_config_dir:      '/home/weblogic'
#
#
# === Authors
#
# @Author: pde
# @Date:   2014-12-23 05:17:48
# @Last Modified by:   pde
# @Last Modified time: 2014-12-23 06:33:32
#
# === Copyright
#
# Copyright 2015 Above Property LLC, unless otherwise noted.
#
class weblogic::userconfig {
  require orawls::weblogic, weblogic::domains, weblogic::nodemanager, weblogic::startwls
  $default_params = {}
  $userconfig_instances = hiera('userconfig_instances', {})
  create_resources('orawls::storeuserconfig',$userconfig_instances, $default_params)
 }
