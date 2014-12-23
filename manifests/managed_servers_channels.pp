# == Class: weblogic::managed_servers_channels
#
# Wrapper that instantiates the wls_server_channel type
# from biemond-orawls.
#
# === Parameters
#
# === Variables
#
# === Examples
#
#  class { 'weblogic::managed_servers_channels': }
#
# in hiera:
#
# server_channel_instances:
#   'wlsServer1:Channel-Cluster':
#     ensure:           'present'
#     enabled:          '1'
#     httpenabled:      '1'
#     listenaddress:    '10.10.10.100'
#     listenport:       '8003'
#     outboundenabled:  '0'
#     protocol:         'cluster-broadcast'
#     publicaddress:    '10.10.10.100'
#     tunnelingenabled: '0'
#   'wlsServer2:Channel-Cluster':
#     ensure:           'present'
#     enabled:          '1'
#     httpenabled:      '1'
#     listenport:       '8003'
#     outboundenabled:  '0'
#     protocol:         'cluster-broadcast'
#     tunnelingenabled: '0'
#
# === Authors
#
# @Author: pde
# @Date:   2014-12-23 05:17:48
# @Last Modified by:   pde
# @Last Modified time: 2014-12-23 08:04:28
#
# === Copyright
#
# Copyright 2015 Above Property LLC, unless otherwise noted.
#
class weblogic::managed_servers_channels {
  require weblogic::managed_servers
  $default_params = {}
  $server_channel_instances = hiera('server_channel_instances', {})
  create_resources('wls_server_channel',$server_channel_instances, $default_params)
 }
