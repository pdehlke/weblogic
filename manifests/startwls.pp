# == Class: weblogic::startwls
#
# Wrapper around biemond-orawls::control. Starts weblogic server.
#
# === Parameters
#
# === Variables
#
# === Examples
#
#  class { 'weblogic::startwls':}
#
# in hiera:
#
# # startup adminserver for extra configuration
# control_instances:
#   'startWLSAdminServer':
#      domain_name:          *domain_name
#      server_type:          'admin'
#      target:               'Server'
#      server:               *domain_adminserver
#      action:               'start'
#      log_output:           *logoutput
#
# === Authors
#
# @Author: pde
# @Date:   2014-12-23 05:17:55
# @Last Modified by:   pde
# @Last Modified time: 2014-12-23 06:36:06
#
# === Copyright
#
# Copyright 2015 Above Property LLC, unless otherwise noted.
#
class weblogic::startwls {
  require orawls::weblogic,weblogic::domains,weblogic::nodemanager,weblogic::libs

  $default_params = {}
  $control_instances = hiera('control_instances', {})
  create_resources('orawls::control',$control_instances, $default_params)
 }
