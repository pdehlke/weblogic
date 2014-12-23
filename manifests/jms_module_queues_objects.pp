# == Class: weblogic::jms_module_queues_objects
#
# Wrapper that instantiates the wls_jsm_queue type from biemond-orawls.
#
# === Parameters
#
# === Variables
#
# === Examples
#
#  class { 'weblogic::jms_module_queues_objects':}
#
# in hiera:
#
# jms_queue_instances:
#    'jmsClusterModule:ErrorQueue':
#      ensure:                   'present'
#      distributed:              '1'
#      expirationpolicy:         'Discard'
#      jndiname:                 'jms/ErrorQueue'
#      redeliverydelay:          '-1'
#      redeliverylimit:          '-1'
#      subdeployment:            'jmsServers'
#      defaulttargeting:         '0'
#      timetodeliver:            '-1'
#      timetolive:               '-1'
#    'jmsClusterModule:Queue1':
#      ensure:                   'present'
#      distributed:              '1'
#      errordestination:         'ErrorQueue'
#      expirationpolicy:         'Redirect'
#      jndiname:                 'jms/Queue1'
#      redeliverydelay:          '2000'
#      redeliverylimit:          '3'
#      subdeployment:            'jmsServers'
#      defaulttargeting:         '0'
#      timetodeliver:            '-1'
#      timetolive:               '300000'
#    'jmsClusterModule:Queue2':
#      ensure:                   'present'
#      distributed:              '1'
#      expirationloggingpolicy:  '%header%%properties%'
#      expirationpolicy:         'Log'
#      jndiname:                 'jms/Queue2'
#      redeliverydelay:          '2000'
#      redeliverylimit:          '3'
#      subdeployment:            'jmsServers'
#      defaulttargeting:         '0'
#      timetodeliver:            '-1'
#      timetolive:               '300000'
#
# === Authors
#
# @Author: pde
# @Date:   2014-12-23 05:17:48
# @Last Modified by:   pde
# @Last Modified time: 2014-12-23 08:22:14
#
# === Copyright
#
# Copyright 2015 Above Property LLC, unless otherwise noted.
#
class weblogic::jms_module_queues_objects {
  require weblogic::jms_module_cfs
  $default_params = {}
  $jms_queue_instances = hiera('jms_queue_instances', {})
  create_resources('wls_jms_queue',$jms_queue_instances, $default_params)
 }
