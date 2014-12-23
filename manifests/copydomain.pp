# == Class: weblogic::copydomain
#
# Wrapper around biemond-orawls::copydomain.
#
# === Parameters
#
# === Variables
#
# === Examples
#
#  class { 'weblogic::copydomain ':
#    ntp_servers => [ 'pool.ntp.org', 'ntp.local.company.com' ]
#  }
#
# In hiera:
#
# copy_instances:
#   'wlsDomain':
#      log_output:              *logoutput
#
# === Authors
#
# @Author: pde
# @Date:   2014-12-23 05:17:55
# @Last Modified by:   pde
# @Last Modified time: 2014-12-23 08:52:03
#
# === Copyright
#
# Copyright 2015 Above Property LLC, unless otherwise noted.
#
class weblogic::copydomain {
  require orawls::weblogic, weblogic::bsu
  $default_params = {}
  $copy_instances = hiera('copy_instances', {})
  create_resources('orawls::copydomain',$copy_instances, $default_params)
}
