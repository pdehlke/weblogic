# == Class: weblogic::datasources
#
# Wrapper to instantiate the wls_datasource type from biemond-orawls.
#
# === Parameters
#
# === Variables
#
# === Examples
#
#  class { 'weblogic::datasources': }
#
# in hiera:
#
# datasource_instances:
#     'useradminDS':
#       ensure:                      'present'
#       drivername:                  'oracle.jdbc.xa.client.OracleXADataSource'
#       extraproperties:
#         - 'SendStreamAsBlob=true'
#         - 'oracle.net.CONNECT_TIMEOUT=1000'
#       globaltransactionsprotocol:  'TwoPhaseCommit'
#       initialcapacity:             '1'
#       jndinames:
#        - 'jdbc/useradminDS'
#       maxcapacity:                 '15'
#       target:
#         - 'WebCluster'
#       targettype:
#         - 'Cluster'
#       testtablename:               'SQL SELECT 1 FROM DUAL'
#       url:                         "jdbc:oracle:thin:@dbagent2.alfa.local:1521/test.oracle.com"
#       user:                        'hr'
#       usexa:                       '1'
#
# === Authors
#
# @Author: pde
# @Date:   2014-12-23 05:17:55
# @Last Modified by:   pde
# @Last Modified time: 2014-12-23 07:28:58
#
# === Copyright
#
# Copyright 2015 Above Property LLC, unless otherwise noted.
#
class weblogic::datasources {
  require weblogic::clusters, weblogic::managed_servers_channels
  $default_params = {}
  $datasource_instances = hiera('datasource_instances', {})
  create_resources('wls_datasource',$datasource_instances, $default_params)
}
