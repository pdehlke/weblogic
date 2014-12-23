# == Class: weblogic::virtual_hosts
#
# Wrapper class to instantiate a wls_virtual_host type via biemond-orawls
#
# === Parameters
#
# === Variables
#
# === Examples
#
#  class { 'weblogic::virtual_hosts':}
#
# in hiera:
#
# virtual_host_instances:
#  'WS':
#    ensure:     'present'
#    channel:    'HTTP'
#    target:
#      - 'WebCluster'
#    targettype:
#      - 'Cluster'
#    virtual_host_names:
#      - 'admin.example.com'
#      - '10.10.10.10'
#
# === Authors
#
# @Author: pde
# @Date:   2014-12-23 05:17:48
# @Last Modified by:   pde
# @Last Modified time: 2014-12-23 06:28:54
#
# === Copyright
#
# Copyright 2015 Above Property LLC, unless otherwise noted.
#
class weblogic::virtual_hosts {
  require weblogic::clusters
  $default_params = {}
  $virtual_host_instances = hiera('virtual_host_instances', {})
  create_resources('wls_virtual_host',$virtual_host_instances, $default_params)
 }
