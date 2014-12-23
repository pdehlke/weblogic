# == Class: weblogic::saf_error_handlers
#
# Wrapper to instantiate the wls_saf_error_handlers type
# from biemond-orawls.
#
# === Parameters
#
# === Variables
#
# === Examples
#
#  class { 'weblogic::saf_error_handlers':}
#
# in hiera:
#
# saf_error_handler_instances:
#   'jmsClusterModule:ErrorHandling-0':
#      ensure:           'present'
#      policy:           'Discard'
#   'jmsClusterModule:ErrorHandling-1':
#      ensure:           'present'
#      policy:           'Log'
#      logformat:        '%header%%properties%'
#
# === Authors
#
# @Author: pde
# @Date:   2014-12-23 05:17:48
# @Last Modified by:   pde
# @Last Modified time: 2014-12-23 06:49:30
#
# === Copyright
#
# Copyright 2015 Above Property LLC, unless otherwise noted.
#
class weblogic::saf_error_handlers {
  require weblogic::saf_remote_context_objects
  $default_params = {}
  $saf_error_handler_instances = hiera('saf_error_handler_instances', {})
  create_resources('wls_saf_error_handler',$saf_error_handler_instances, $default_params)
 }
