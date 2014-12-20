class weblogic::domain {

require orawls::weblogic

$default_params = {}
  $domain_instances = hiera('domain_instances', {})
  create_resources('orawls::domain',$domain_instances, $default_params)

}
