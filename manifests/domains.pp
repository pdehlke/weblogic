# == Class: weblogic::domains
#
# Wrapper around biemond-orawls::domain.
#
# === Parameters
#
# === Variables
#
# === Examples
#
#  class { 'weblogic::domains ':}
#
# In hiera:
#
# domain_instances:
#   'qaua1Domain':
#     domain_template:                       "standard"
#     development_mode:                      true
#     log_output:                            *logoutput
#     custom_identity:                       false
#
# === Authors
#
# @Author: pde
# @Date:   2014-12-23 05:17:48
# @Last Modified by:   pde
# @Last Modified time: 2014-12-23 08:50:05
#
# === Copyright
#
# Copyright 2015 Above Property LLC, unless otherwise noted.
#
class weblogic::domains {
  require orawls::weblogic, weblogic::opatch

  $default_params = {}
  $domain_instances = hiera('domain_instances', {})
  create_resources('orawls::domain',$domain_instances, $default_params)

  $wls_setting_instances = hiera('wls_setting_instances', {})
  create_resources('wls_setting',$wls_setting_instances, $default_params)

}
