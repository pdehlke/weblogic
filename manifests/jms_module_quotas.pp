class weblogic::jms_module_quotas {
  require weblogic::jms_module_subdeployments
  $default_params = {}
  $jms_quota_instances = hiera('jms_quota_instances', {})
  create_resources('wls_jms_quota',$jms_quota_instances, $default_params)
 }
