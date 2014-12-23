# == Class: weblogic::foreign_server_entries_objects
#
# Wrapper that instantiates the wls_foreign_server_object from biemond-orawls.
#
# === Parameters
#
# === Variables
#
# === Examples
#
#  class { 'weblogic::foreign_server_entries_objects':}
#
# in hiera:
#
# foreign_server_object_instances:
# 'jmsClusterModule:Jboss:CF':
#     ensure:         'present'
#     localjndiname:  'jms/jboss/CF'
#     object_type:    'connectionfactory'
#     remotejndiname: 'jms/Remote/CF'
# 'jmsClusterModule:Jboss:JBossQ':
#     ensure:         'present'
#     localjndiname:  'jms/jboss/Queue'
#     object_type:    'destination'
#     remotejndiname: 'jms/Remote/Queue'
# 'jmsClusterModule:AQForeignServer:XAQueueCF':
#     ensure:         'present'
#     localjndiname:  'jms/XAQueueCF'
#     object_type:    'connectionfactory'
#     remotejndiname: 'XAQueueConnectionFactory'
# 'jmsClusterModule:AQForeignServer:TestQueue':
#     ensure:         'present'
#     localjndiname:  'jms/aq/TestQueue'
#     object_type:    'destination'
#     remotejndiname: 'Queues/TestQueue'
#
# === Authors
#
# @Author: pde
# @Date:   2014-12-23 05:17:48
# @Last Modified by:   pde
# @Last Modified time: 2014-12-23 08:32:20
#
# === Copyright
#
# Copyright 2015 Above Property LLC, unless otherwise noted.
#
class weblogic::foreign_server_entries_objects {
  require weblogic::foreign_server_objects
  $default_params = {}
  $foreign_server_object_instances = hiera('foreign_server_object_instances', {})
  create_resources('wls_foreign_server_object',$foreign_server_object_instances, $default_params)
 }
