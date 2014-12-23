# == Class: weblogic::groups
#
# Wrapper that instantiates the wls_group type from biemond-orawls.
#
# === Parameters
#
# === Variables
#
# === Examples
#
#  class { 'weblogic::groups':}
#
# in hiera:
#
# group_instances:
#   'TestGroup':
#     ensure:                 'present'
#     authenticationprovider: 'DefaultAuthenticator'
#     description:            'My TestGroup'
#     realm:                  'myrealm'
#     users:
#       - 'testuser1'
#       - 'testuser2'
#   'SuperUsers':
#     ensure:                 'present'
#     authenticationprovider: 'DefaultAuthenticator'
#     description:            'SuperUsers'
#     realm:                  'myrealm'
#     users:
#       - 'testuser2'
#
# === Authors
#
# @Author: pde
# @Date:   2014-12-23 05:17:48
# @Last Modified by:   pde
# @Last Modified time: 2014-12-23 08:27:18
#
# === Copyright
#
# Copyright 2015 Above Property LLC, unless otherwise noted.
#
class weblogic::groups {
  require weblogic::users
  $default_params = {}
  $group_instances = hiera('group_instances', {})
  create_resources('wls_group',$group_instances, $default_params)
 }
