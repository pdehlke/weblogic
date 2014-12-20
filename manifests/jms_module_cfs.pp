class weblogic::jms_module_cfs {
  require weblogic::jms_module_quotas
  $default_params = {}
  $jms_connection_factory_instances = hiera('jms_connection_factory_instances', {})
  create_resources('wls_jms_connection_factory',$jms_connection_factory_instances, $default_params)
 }
