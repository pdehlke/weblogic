class weblogic::jms_module_subdeployments {
  require weblogic::jms_modules
  $default_params = {}
  $jms_subdeployment_instances = hiera('jms_subdeployment_instances', {})
  create_resources('wls_jms_subdeployment',$jms_subdeployment_instances, $default_params)
 }
