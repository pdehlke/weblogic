# == Class: weblogic::users
#
# Wrapper class to instantiate wls_user via biemond-orawls
#
# === Parameters
#
# === Variables
#
# === Examples
#
#  class { 'weblogic::users':}
#
# in hiera:
#
# user_instances:
#   'testuser1':
#     ensure:                 'present'
#     password:               'weblogic1'
#     authenticationprovider: 'DefaultAuthenticator'
#     realm:                  'myrealm'
#     description:            'my test user'
#   'testuser2':
#     ensure:                 'present'
#     password:               'weblogic1'
#     authenticationprovider: 'DefaultAuthenticator'
#     realm:                  'myrealm'
#     description:            'my test user'
#   'testuser3':
#     ensure:                 'present'
#     password:               'weblogic1'
#     authenticationprovider: 'DefaultAuthenticator'
#     realm:                  'myrealm'
#     description:            'my test user'
#
# === Authors
#
# @Author: pde
# @Date:   2014-12-23 05:17:48
# @Last Modified by:   pde
# @Last Modified time: 2014-12-23 06:31:33
#
# === Copyright
#
# Copyright 2015 Above Property LLC, unless otherwise noted.
#
class weblogic::users {
  require weblogic::userconfig
  $default_params = {}
  $user_instances = hiera('user_instances', {})
  create_resources('wls_user',$user_instances, $default_params)
 }
