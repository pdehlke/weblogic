class weblogic::saf_remote_context_objects {
  require weblogic::foreign_server_entries_objects
  $default_params = {}
  $saf_remote_context_instances = hiera('saf_remote_context_instances', {})
  create_resources('wls_saf_remote_context',$saf_remote_context_instances, $default_params)
 }
