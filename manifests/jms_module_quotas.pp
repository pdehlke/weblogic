# == Class: weblogic::jms_module_quotas
#
# Wrapper that instantiates the wls_jms_quota type from biemond-orawls.
#
# === Parameters
#
# === Variables
#
# === Examples
#
#  class { 'weblogic::jms_module_quotas ':}
#
# in hiera:
#
# jms_quota_instances:
#    'jmsClusterModule:QuotaBig':
#       ensure:           'present'
#       bytesmaximum:     '9223372036854775807'
#       messagesmaximum:  '9223372036854775807'
#       policy:           'FIFO'
#       shared:           '1'
#    'jmsClusterModule:QuotaLow':
#       ensure:           'present'
#       bytesmaximum:     '20000000000'
#       messagesmaximum:  '9223372036854775807'
#       policy:           'FIFO'
#       shared:           '0'
#
# === Authors
#
# @Author: pde
# @Date:   2014-12-23 05:17:48
# @Last Modified by:   pde
# @Last Modified time: 2014-12-23 08:20:36
#
# === Copyright
#
# Copyright 2015 Above Property LLC, unless otherwise noted.
#
class weblogic::jms_module_quotas {
  require weblogic::jms_module_subdeployments
  $default_params = {}
  $jms_quota_instances = hiera('jms_quota_instances', {})
  create_resources('wls_jms_quota',$jms_quota_instances, $default_params)
 }
