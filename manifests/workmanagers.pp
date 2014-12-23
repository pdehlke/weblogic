# == Class: weblogic::workmanagers
#
# Wrapper for the wls_workmanager type in biemond-orawls.
#
# === Parameters
#
# === Variables
#
# === Examples
#
#  class { 'weblogic::workmanagers':}
#
# in hiera:
#
# workmanager_instances:
#   'WorkManagerConstraints':
#     ensure:                'present'
#     capacity:              'CapacityConstraint'
#     maxthreadsconstraint:  'MaxThreadsConstraint'
#     minthreadsconstraint:  'MinThreadsConstraint'
#     stuckthreads:          '1'
#     target:
#       - 'WebCluster'
#     targettype:
#       - 'Cluster'
#
# === Authors
#
# @Author: pde
# @Date:   2014-12-23 05:17:48
# @Last Modified by:   pde
# @Last Modified time: 2014-12-23 06:22:05
#
# === Copyright
#
# Copyright 2015 Above Property LLC, unless otherwise noted.
#
class weblogic::workmanagers {
  require weblogic::workmanager_constraints
  $default_params = {}
  $workmanager_instances = hiera('workmanager_instances', {})
  create_resources('wls_workmanager',$workmanager_instances, $default_params)
 }
