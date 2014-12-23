# == Class: weblogic::jms_saf_agents
#
# Wrapper that instantiates the wls_safagent type from biemond-orawls.
#
# === Parameters
#
# === Variables
#
# === Examples
#
#  class { 'weblogic::jms_saf_agents':}
#
# in hiera:
#
# safagent_instances:
#   'jmsSAFAgent1':
#         ensure:              'present'
#         target:
#           - 'wlsServer1'
#         targettype:
#           - 'Server'
#         servicetype:         'Sending-only'
#         persistentstore:     'jmsFileSAFAgent1'
#         persistentstoretype: 'FileStore'
#   'jmsSAFAgent2':
#         ensure:              'present'
#         target:
#           - 'wlsServer2'
#         targettype:
#           - 'Server'
#         servicetype:         'Both'
#
# === Authors
#
# @Author: pde
# @Date:   2014-12-23 05:17:48
# @Last Modified by:   pde
# @Last Modified time: 2014-12-23 08:13:28
#
# === Copyright
#
# Copyright 2015 Above Property LLC, unless otherwise noted.
#
class weblogic::jms_saf_agents {
  require weblogic::jms_servers
  $default_params = {}
  $safagent_instances = hiera('safagent_instances', {})
  create_resources('wls_safagent',$safagent_instances, $default_params)
 }
