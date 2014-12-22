# == Class: class_name
#
# Full description of class example_class here.
#
# === Parameters
#
# Document parameters here.
#
# [*ntp_servers*]
#   Explanation of what this parameter affects and what it defaults to.
#   e.g. "Specify one or more upstream ntp servers as an array."
#
# === Variables
#
# Here you should define a list of variables that this module would require.
#
# [*enc_ntp_servers*]
#   Explanation of how this variable affects the funtion of this class and if it
#   has a default. e.g. "The parameter enc_ntp_servers must be set by the
#   External Node Classifier as a comma separated list of hostnames." (Note,
#   global variables should not be used in preference to class parameters  as of
#   Puppet 2.6.)
#
# === Examples
#
#  class { 'example_class':
#    ntp_servers => [ 'pool.ntp.org', 'ntp.local.company.com' ]
#  }
#
# === Authors
#
# @Author: pde
# @Date:   2014-12-22 07:18:54
#
# === Copyright
#
# Copyright 2015 Above Property LLC unless otherwise noted.
#
# === Metadata
# @Last Modified by:   pde
# @Last Modified time: 2014-12-22 07:56:06

# == Class: class_name
#
# Full description of class example_class here.
#
# === Parameters
#
# Document parameters here.
#
# [*ntp_servers*]
#   Explanation of what this parameter affects and what it defaults to.
#   e.g. "Specify one or more upstream ntp servers as an array."
#
# === Variables
#
# Here you should define a list of variables that this module would require.
#
# [*enc_ntp_servers*]
#   Explanation of how this variable affects the funtion of this class and if it
#   has a default. e.g. "The parameter enc_ntp_servers must be set by the
#   External Node Classifier as a comma separated list of hostnames." (Note,
#   global variables should not be used in preference to class parameters  as of
#   Puppet 2.6.)
#
# === Examples
#
#  class { 'example_class':
#    ntp_servers => [ 'pool.ntp.org', 'ntp.local.company.com' ]
#  }
#
# === Authors
#
# @Author: pde
# @Date:   2014-12-22 07:18:54
#
# === Copyright
#
# Copyright 2015 Above Property LLC unless otherwise noted.
#
# === Metadata
# @Last Modified by:   pde
# @Last Modified time: 2014-12-22 07:18:54

class weblogic::admin {

  include weblogic::os
  include weblogic::ssh
  include weblogic::java, orawls::urandomfix
  include orawls::weblogic, orautils
  include weblogic::bsu
  include weblogic::fmw
  include weblogic::opatch
  include weblogic::domains
  include weblogic::nodemanager, weblogic::startwls, weblogic::userconfig
  include weblogic::users
  include weblogic::groups
  include weblogic::machines
  include weblogic::managed_servers
  include weblogic::managed_servers_channels
  include weblogic::datasources
  include weblogic::clusters
  include weblogic::virtual_hosts
  include weblogic::workmanager_constraints
  include weblogic::workmanagers
  include weblogic::file_persistence
  include weblogic::jms_servers
  include weblogic::jms_saf_agents
  include weblogic::jms_modules
  include weblogic::jms_module_subdeployments
  include weblogic::jms_module_quotas
  include weblogic::jms_module_cfs
  include weblogic::jms_module_queues_objects
  include weblogic::jms_module_topics_objects
  include weblogic::foreign_server_objects
  include weblogic::foreign_server_entries_objects
  include weblogic::saf_remote_context_objects
  include weblogic::saf_error_handlers
  include weblogic::saf_imported_destination
  include weblogic::saf_imported_destination_objects
  include weblogic::pack_domain

  Class[weblogic::os] -> Class[weblogic::java] -> Class[orawls::weblogic]
}
