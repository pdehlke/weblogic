# == Class: weblogic::authentication_providers
#
# Wrapper that instantiates the wls_authentication_providers type
# from biemond-orawls.
#
# === Parameters
#
# === Variables
#
# === Examples
#
#  class { 'weblogic::authentication_providers':}
#
# in hiera:
#
# authentication_provider_instances:
#   'DefaultAuthenticator':
#     ensure:             'present'
#     control_flag:       'SUFFICIENT'
#   'DefaultIdentityAsserter':
#     ensure:             'present'
#     providerclassname:  'weblogic.security.providers.authentication.DefaultIdentityAsserter'
#     attributes:         'DigestReplayDetectionEnabled;UseDefaultUserNameMapper;DefaultUserNameMapperAttributeType;ActiveTypes'
#     attributesvalues:   '1;1;CN;AuthenticatedUser::X.509'
#   #ldap will be the first listed provider
#   'ldap':
#     ensure:             'present'
#     control_flag:       'SUFFICIENT'
#     providerclassname:  'weblogic.security.providers.authentication.LDAPAuthenticator'
#     attributes:         'Principal;Host;Port;CacheTTL;CacheSize;MaxGroupMembershipSearchLevel;SSLEnabled'
#     attributesvalues:   'ldapuser;ldapserver;389;60;1024;4;1'
#     order:              '0'
#
# === Authors
#
# @Author: pde
# @Date:   2014-12-23 05:17:48
# @Last Modified by:   pde
# @Last Modified time: 2014-12-23 07:54:42
#
# === Copyright
#
# Copyright 2015 Above Property LLC, unless otherwise noted.
#
class weblogic::authentication_providers{
  require weblogic::groups
  $default_params = {}
  $authentication_provider_instances = hiera('authentication_provider_instances', {})
  create_resources('wls_authentication_provider',$authentication_provider_instances, $default_params)
}