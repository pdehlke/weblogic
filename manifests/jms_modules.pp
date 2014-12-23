# == Class: weblogic::jms_modules
#
# Wrapper that instantiates the wls_jms_module type from biemond-orawls.
#
# === Parameters
#
# === Variables
#
# === Examples
#
#  class { 'weblogic::jms_modules':}
#
# in hiera:
#
# jms_module_instances:
#    'jmsClusterModule':
#      ensure:      'present'
#      target:
#        - 'WebCluster'
#      targettype:
#        - 'Cluster'
#
# === Authors
#
# @Author: pde
# @Date:   2014-12-23 05:17:48
# @Last Modified by:   pde
# @Last Modified time: 2014-12-23 08:15:17
#
# === Copyright
#
# Copyright 2015 Above Property LLC, unless otherwise noted.
#
class weblogic::jms_modules {
  require weblogic::jms_saf_agents
  $default_params = {}
  $jms_module_instances = hiera('jms_module_instances', {})
  create_resources('wls_jms_module',$jms_module_instances, $default_params)
 }
