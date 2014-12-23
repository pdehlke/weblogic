# == Class: weblogic::jms_module_subdeployments
#
# Wrapper that instantiates the wls_jms_subdeployment type
# from biemond-orawls.
#
# === Parameters
#
# === Variables
#
# === Examples
#
#  class { 'weblogic::jms_module_subdeployments': }
#
# in hiera:
#
# jms_subdeployment_instances:
#    'jmsClusterModule:jmsServers':
#       ensure:     'present'
#       target:
#         - 'jmsServer1'
#         - 'jmsServer2'
#       targettype:
#         - 'JMSServer'
#         - 'JMSServer'
#    'jmsClusterModule:wlsServers':
#       ensure:     'present'
#       target:
#         - 'WebCluster'
#       targettype:
#         - 'Cluster'
#
# === Authors
#
# @Author: pde
# @Date:   2014-12-23 05:17:48
# @Last Modified by:   pde
# @Last Modified time: 2014-12-23 08:18:45
#
# === Copyright
#
# Copyright 2015 Above Property LLC, unless otherwise noted.
#
class weblogic::jms_module_subdeployments {
  require weblogic::jms_modules
  $default_params = {}
  $jms_subdeployment_instances = hiera('jms_subdeployment_instances', {})
  create_resources('wls_jms_subdeployment',$jms_subdeployment_instances, $default_params)
 }
