class weblogic::authentication_providers{
  require weblogic::groups
  $default_params = {}
  $authentication_provider_instances = hiera('authentication_provider_instances', {})
  create_resources('wls_authentication_provider',$authentication_provider_instances, $default_params)
}