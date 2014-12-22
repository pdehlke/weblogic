class weblogic::foreign_server_objects {
  require weblogic::jms_module_topics_objects
  $default_params = {}
  $foreign_server_instances = hiera('foreign_server_instances', {})
  create_resources('wls_foreign_server',$foreign_server_instances, $default_params)
 }
