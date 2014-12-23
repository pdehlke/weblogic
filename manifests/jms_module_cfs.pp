# == Class: weblogic::jms_module_cfs
#
# Wrapper that instantiates the wls_jms_connection_factory type
# from biemond-orawls.
#
# === Parameters
#
# === Variables
#
# === Examples
#
#  class { 'weblogic::jms_module_cfs': }
#
# in hiera:
#
# jms_connection_factory_instances:
#   'jmsClusterModule:cf':
#       ensure:             'present'
#       jmsmodule:          'jmsClusterModule'
#       defaulttargeting:   '0'
#       jndiname:           'jms/cf'
#       subdeployment:      'wlsServers'
#       transactiontimeout: '3600'
#       xaenabled:          '0'
#   'jmsClusterModule:cf2':
#       ensure:             'present'
#       jmsmodule:          'jmsClusterModule'
#       defaulttargeting:   '1'
#       jndiname:           'jms/cf2'
#       transactiontimeout: '3600'
#       xaenabled:          '1'
#
# === Authors
#
# @Author: pde
# @Date:   2014-12-23 05:17:48
# @Last Modified by:   pde
# @Last Modified time: 2014-12-23 08:23:49
#
# === Copyright
#
# Copyright 2015 Above Property LLC, unless otherwise noted.
#
class weblogic::jms_module_cfs {
  require weblogic::jms_module_quotas
  $default_params = {}
  $jms_connection_factory_instances = hiera('jms_connection_factory_instances', {})
  create_resources('wls_jms_connection_factory',$jms_connection_factory_instances, $default_params)
 }
