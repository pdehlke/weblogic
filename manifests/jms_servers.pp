# == Class: weblogic::jms_servers
#
# Wrapper that instantiates the wls_jmsserver type from biemond-orawls.
#
# === Parameters
#
# === Variables
#
# === Examples
#
#  class { 'weblogic::jms_servers':}
#
# in hiera:
#
# jmssver_instances:
#    'jmsServer1':
#      ensure:              'present'
#      target:
#        - 'wlsServer1'
#      targettype:
#        - 'Server'
#      persistentstore:     'jmsFile1'
#      persistentstoretype: 'FileStore'
#    'jmsServer2':
#      ensure:              'present'
#      target:
#        - 'wlsServer2'
#      targettype:
#        - 'Server'
#
# === Authors
#
# @Author: pde
# @Date:   2014-12-23 05:17:48
# @Last Modified by:   pde
# @Last Modified time: 2014-12-23 08:11:18
#
# === Copyright
#
# Copyright 2015 Above Property LLC, unless otherwise noted.
#
class weblogic::jms_servers {
  require weblogic::file_persistence
  $default_params = {}
  $jmsserver_instances = hiera('jmsserver_instances', {})
  create_resources('wls_jmsserver',$jmsserver_instances, $default_params)
 }
