class weblogic::jms_modules {
  require weblogic::jms_saf_agents
  $default_params = {}
  $jms_module_instances = hiera('jms_module_instances', {})
  create_resources('wls_jms_module',$jms_module_instances, $default_params)
 }
