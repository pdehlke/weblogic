# == Class: weblogic::saf_imported_destination_objects
#
# Wrapper to instantiate the saf_imported_destination_object type
# from biemond-orawls.
#
# === Parameters
#
# === Variables
#
# === Examples
#
#  class { 'weblogic::saf_imported_destination_objects': }
#
# in hiera:
#
# saf_imported_destination_object_instances:
#   'jmsClusterModule:SAFImportedDestinations-0:SAFDemoQueue':
#       ensure:                'present'
#       object_type:           'queue'
#       remotejndiname:        'jms/DemoQueue'
#       unitoforderrouting:    'Hash'
#       nonpersistentqos:      'Exactly-Once'
#   'jmsClusterModule:SAFImportedDestinations-0:SAFDemoTopic':
#       ensure:                'present'
#       object_type:           'topic'
#       remotejndiname:        'jms/DemoTopic'
#       timetolivedefault:     '100000000'
#       unitoforderrouting:    'Hash'
#       usetimetolivedefault:  '1'
#       nonpersistentqos:      'Exactly-Once'
#
# === Authors
#
# @Author: pde
# @Date:   2014-12-23 05:17:48
# @Last Modified by:   pde
# @Last Modified time: 2014-12-23 06:44:45
#
# === Copyright
#
# Copyright 2015 Above Property LLC, unless otherwise noted.
#
class weblogic::saf_imported_destination_objects {
  require weblogic::saf_imported_destination
  $default_params = {}
  $saf_imported_destination_object_instances = hiera('saf_imported_destination_object_instances', {})
  create_resources('wls_saf_imported_destination_object',$saf_imported_destination_object_instances, $default_params)
 }
