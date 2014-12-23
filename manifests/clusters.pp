# == Class: weblogic::clusters
#
# Wrapper that instantiastes the wls_cluster type from biemond-orawls.
#
# === Parameters
#
# === Variables
#
# === Examples
#
#  class { 'weblogic::clusters':}
#
# In hiera:
#
# cluster_instances:
#   'WebCluster':
#     ensure:                     'present'
#     migrationbasis:             'consensus'
#     servers:
#       - 'wlsServer1'
#       - 'wlsServer2'
#     messagingmode:              'unicast'
#     unicastbroadcastchannel:    'Channel-Cluster'
#
# === Authors
#
# @Author: pde
# @Date:   2014-12-23 05:17:55
# @Last Modified by:   pde
# @Last Modified time: 2014-12-23 08:53:33
#
# === Copyright
#
# Copyright 2015 Above Property LLC, unless otherwise noted.
#
class weblogic::clusters {
  require weblogic::managed_servers
  $default_params = {}
  $cluster_instances = hiera('cluster_instances', {})
  create_resources('wls_cluster',$cluster_instances, $default_params)
 }
