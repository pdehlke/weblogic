# == Class: weblogic::saf_remote_context_objects
#
# Wrapper to instantiate the wls_saf_remote_context type from biemond-orawls
#
# === Parameters
#
# === Variables
#
# === Examples
#
#  class { 'weblogic::saf_remote_context_objects':}
#
# in hiera:
#
# saf_remote_context_instances:
#   'jmsClusterModule:RemoteSAFContext-0':
#      ensure:            'present'
#      connect_url:       't3://10.10.10.10:7001'
#      weblogic_user:     'weblogic'
#      weblogic_password: 'weblogic1'
#   'jmsClusterModule:RemoteSAFContext-1':
#      ensure:            'present'
#      connect_url:       't3://10.10.10.10:7001'
#
# === Authors
#
# @Author: pde
# @Date:   2014-12-23 05:17:48
# @Last Modified by:   pde
# @Last Modified time: 2014-12-23 06:42:12
#
# === Copyright
#
# Copyright 2015 Above Property LLC, unless otherwise noted.
#
class weblogic::saf_remote_context_objects {
  require weblogic::foreign_server_entries_objects
  $default_params = {}
  $saf_remote_context_instances = hiera('saf_remote_context_instances', {})
  create_resources('wls_saf_remote_context',$saf_remote_context_instances, $default_params)
 }
