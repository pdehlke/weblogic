# == Class: weblogic::foreign_server_objects
#
# Wrapper that instantiates the wls_foreign_server type from biemond-orawls.
#
# === Parameters
#
# === Variables
#
# === Examples
#
#  class { 'weblogic::foreign_server_objects':}
#
# in hiera:
#
# foreign_server_instances:
#   'jmsClusterModule:AQForeignServer':
#       ensure:                'present'
#       defaulttargeting:      '1'
#       extraproperties:
#         - 'datasource=jdbc/hrDS'
#       initialcontextfactory: 'oracle.jms.AQjmsInitialContextFactory'
#   'jmsClusterModule:Jboss':
#       ensure:                'present'
#       connectionurl:         'remote://10.10.10.10:4447'
#       defaulttargeting:      '0'
#       extraproperties:
#         - 'java.naming.security.principal=jmsuser'
#       initialcontextfactory: 'org.jboss.naming.remote.client.InitialContextFactory'
#       subdeployment:         'wlsServers'
#       password:              'test'
#
# === Authors
#
# @Author: pde
# @Date:   2014-12-23 05:17:48
# @Last Modified by:   pde
# @Last Modified time: 2014-12-23 08:29:27
#
# === Copyright
#
# Copyright 2015 Above Property LLC, unless otherwise noted.
#
class weblogic::foreign_server_objects {
  require weblogic::jms_module_topics_objects
  $default_params = {}
  $foreign_server_instances = hiera('foreign_server_instances', {})
  create_resources('wls_foreign_server',$foreign_server_instances, $default_params)
 }
