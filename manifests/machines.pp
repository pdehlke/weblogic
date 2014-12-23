# == Class: weblogic::machines
#
# Wrapper that instantiates the wls_machine type from biemond-orawls.
#
# === Parameters
#
# === Variables
#
# === Examples
#
#  class { 'weblogic::machines':}
#
# in hiera:
#
# Node1 will use default as wls_setting identifier
# Node2 will use domain2 as wls_setting identifier
# machines_instances:
#   'Node1':
#     ensure:         'present'
#     listenaddress:  '10.10.10.100'
#     listenport:     '5556'
#     machinetype:    'UnixMachine'
#     nmtype:         'SSL'
#   'domain2/Node2':
#     ensure:         'present'
#     listenaddress:  '10.10.10.200'
#     listenport:     '5556'
#     machinetype:    'UnixMachine'
#     nmtype:         'SSL'
#
# === Authors
#
# @Author: pde
# @Date:   2014-12-23 05:17:48
# @Last Modified by:   pde
# @Last Modified time: 2014-12-23 08:08:32
#
# === Copyright
#
# Copyright 2015 Above Property LLC, unless otherwise noted.
#
class weblogic::machines {
  require weblogic::authentication_providers
  $default_params = {}
  $machines_instances = hiera('machines_instances', {})
  create_resources('wls_machine',$machines_instances, $default_params)
 }
