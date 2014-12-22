class weblogic::jms_saf_agents {
  require weblogic::jms_servers
  $default_params = {}
  $safagent_instances = hiera('safagent_instances', {})
  create_resources('wls_safagent',$safagent_instances, $default_params)
 }
