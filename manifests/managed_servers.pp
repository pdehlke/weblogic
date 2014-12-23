# == Class: weblogic::managed_servers
#
# Wrapper that instantiates the wls_server type from
# biemond-orawls.
#
# === Parameters
#
# === Variables
#
# === Examples
#
#  class { 'weblogic::managed_servers': }
#
# in hiera:
#
# server_instances:
#   'wlsServer1':
#      ensure:                         'present'
#      arguments:                      '-XX:PermSize=256m -XX:MaxPermSize=256m -Xms752m -Xmx752m -Dweblogic.Stdout=/data/logs/wlsServer1.out -Dweblogic.Stderr=/data/logs/wlsServer1_err.out'
#      listenaddress:                  '10.10.10.100'
#      listenport:                     '8001'
#      logfilename:                    '/data/logs/wlsServer1.log'
#      machine:                        'Node1'
#      sslenabled:                     '1'
#      jsseenabled:                    '0'
#      ssllistenport:                  '8201'
#      sslhostnameverificationignored: '1'
#      two_way_ssl:                    '0'
#      client_certificate_enforced:    '0'
#
# === Authors
#
# @Author: pde
# @Date:   2014-12-23 05:17:48
# @Last Modified by:   pde
# @Last Modified time: 2014-12-23 08:06:33
#
# === Copyright
#
# Copyright 2015 Above Property LLC, unless otherwise noted.
#
class weblogic::managed_servers {
  require weblogic::machines
  $default_params = {}
  $server_instances = hiera('server_instances', {})
  create_resources('wls_server',$server_instances, $default_params)
 }
