# == Class: weblogic::saf_imported_destination
#
# Wrapper to instantiate the wls_saf_imported_destination type
# from biemond-orawls.
#
# === Parameters
#
# === Variables
#
# === Examples
#
#  class { 'weblogic::saf_imported_destination': }
#
# in hiera:
#
# saf_imported_destination_instances:
#   'jmsClusterModule:SAFImportedDestinations-1':
#     ensure:               'present'
#     defaulttargeting:     '1'
#     jndiprefix:           'saf2_'
#     remotecontext:        'RemoteSAFContext-1'
#   'jmsClusterModule:SAFImportedDestinations-0':
#     ensure:               'present'
#     defaulttargeting:     '0'
#     subdeployment:        'safServers'
#     errorhandling:        'ErrorHandling-1'
#     jndiprefix:           'saf_'
#     remotecontext:        'RemoteSAFContext-0'
#     timetolivedefault:    '100000000'
#     usetimetolivedefault: '1'
#
# === Authors
#
# @Author: pde
# @Date:   2014-12-23 05:17:48
# @Last Modified by:   pde
# @Last Modified time: 2014-12-23 06:47:48
#
# === Copyright
#
# Copyright 2015 Above Property LLC, unless otherwise noted.
#
class weblogic::saf_imported_destination {
  require weblogic::saf_error_handlers
  $default_params = {}
  $saf_imported_destination_instances = hiera('saf_imported_destination_instances', {})
  create_resources('wls_saf_imported_destination',$saf_imported_destination_instances, $default_params)
 }
