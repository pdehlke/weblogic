class weblogic::userconfig {
  require orawls::weblogic, weblogic::domains, weblogic::nodemanager, weblogic::startwls
  $default_params = {}
  $userconfig_instances = hiera('userconfig_instances', {})
  create_resources('orawls::storeuserconfig',$userconfig_instances, $default_params)
 }
