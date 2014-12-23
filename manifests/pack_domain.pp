# == Class: weblogic::pack_domain
#
# Wrapper class around biemond-orawls::packdomain. Gets parameters and
# variables from hiera:pack_domain_instances.
#
# === Parameters
#
# === Variables
#
# === Examples
#
#  class { 'weblogic::pack_domain':}
#
# in hiera:
#
# pack_domain_instances:
#   'wlsDomain':
#     log_output:           *logoutput
# #
# === Authors
#
# @Author: pde
# @Date:   2014-12-23 05:17:48
# @Last Modified by:   pde
# @Last Modified time: 2014-12-23 07:35:15
#
# === Copyright
#
# Copyright 2015 Above Property LLC, unless otherwise noted.
#
class weblogic::pack_domain {
  require weblogic::saf_imported_destination_objects
  $default_params = {}
  $pack_domain_instances = hiera('pack_domain_instances', $default_params)
  create_resources('orawls::packdomain',$pack_domain_instances, $default_params)
 }
