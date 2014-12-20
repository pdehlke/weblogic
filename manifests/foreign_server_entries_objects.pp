class weblogic::foreign_server_entries_objects {
  require weblogic::foreign_server_objects
  $default_params = {}
  $foreign_server_object_instances = hiera('foreign_server_object_instances', {})
  create_resources('wls_foreign_server_object',$foreign_server_object_instances, $default_params)
 }
