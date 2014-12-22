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
  #include weblogic::libs
  #include weblogic::properties_files
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
