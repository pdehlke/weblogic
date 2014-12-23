# == Class: weblogic::file_persistence
#
# Wrapper that instantiates the wls_file_persistence_store type
# from biemond-orawls.
#
# === Parameters
#
# === Variables
#
# === Examples
#
#  class { 'weblogic::file_persistence': }
#
# In hiera:
#
# file_persistence_folders:
#    '/opt/oracle/wlsdomains/domains/qaua1Domain/persistence1':
#       ensure:     directory
#       recurse:    false
#       replace:    false
#       mode:       '0775'
#       owner:      'weblogic'
#       group:      'weblogic'
#    '/opt/oracle/wlsdomains/domains/qaua1Domain/persistence2':
#       ensure:     directory
#       recurse:    false
#       replace:    false
#       mode:       '0775'
#       owner:      'weblogic'
#       group:      'weblogic'
#
# === Authors
#
# @Author: pde
# @Date:   2014-12-23 05:17:48
# @Last Modified by:   pde
# @Last Modified time: 2014-12-23 08:48:21
#
# === Copyright
#
# Copyright 2015 Above Property LLC, unless otherwise noted.
#
class weblogic::file_persistence {
  require weblogic::workmanagers

  $default_params = {}
  $file_persistence_folders = hiera('file_persistence_folders', {})
  create_resources('file',$file_persistence_folders, $default_params)

  $file_persistence_store_instances = hiera('file_persistence_store_instances', {})
  create_resources('wls_file_persistence_store',$file_persistence_store_instances, $default_params)
 }
