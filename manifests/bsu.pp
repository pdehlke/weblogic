# == Class: weblogic::bsu
#
# Wrapper around biemond-orawls::bsu. Installs a WebLogic BSU patch.
#
# === Parameters
#
# === Variables
#
# === Examples
#
#  class { 'weblogic::bsu':
#    ntp_servers => [ 'pool.ntp.org', 'ntp.local.company.com' ]
#  }
#
# In hiera:
#
# bsu_instances:
#   'BYJ1':
#      ensure                   "present"
#      patch_id:                "BYJ1"
#      patch_file:              "p17071663_1036_Generic.zip"
#      log_output:              false
#
# === Authors
#
# @Author: pde
# @Date:   2014-12-23 05:17:48
# @Last Modified by:   pde
# @Last Modified time: 2014-12-23 08:55:07
#
# === Copyright
#
# Copyright 2015 Above Property LLC, unless otherwise noted.
#
class weblogic::bsu {
  require orawls::weblogic
  $default_params = {}
  $bsu_instances = hiera('bsu_instances', {})
  create_resources('orawls::bsu',$bsu_instances, $default_params)
 }
