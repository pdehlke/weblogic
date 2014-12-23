# == Class: weblogic::jms_module_topics_objects
#
# Wrapper that instantiates the wls_jms_topic type from biemond::orawls.
#
# === Parameters
#
# === Variables
#
# === Examples
#
#  class { 'weblogic::jms_module_topics_objects':}
#
# in hiera:
#
# jms_topic_instances:
#    'jmsClusterModule:Topic1':
#      ensure:            'present'
#      defaulttargeting:  '0'
#      distributed:       '1'
#      expirationpolicy:  'Discard'
#      jndiname:          'jms/Topic1'
#      redeliverydelay:   '2000'
#      redeliverylimit:   '2'
#      subdeployment:     'jmsServers'
#      timetodeliver:     '-1'
#      timetolive:        '300000'
#
# === Authors
#
# @Author: pde
# @Date:   2014-12-23 05:17:48
# @Last Modified by:   pde
# @Last Modified time: 2014-12-23 08:17:06
#
# === Copyright
#
# Copyright 2015 Above Property LLC, unless otherwise noted.
#
class weblogic::jms_module_topics_objects {
  require weblogic::jms_module_queues_objects
  $default_params = {}
  $jms_topic_instances = hiera('jms_topic_instances', {})
  create_resources('wls_jms_topic',$jms_topic_instances, $default_params)
 }
