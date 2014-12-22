class weblogic::copydomain {
  require orawls::weblogic, weblogic::bsu
  $default_params = {}
  $copy_instances = hiera('copy_instances', {})
  create_resources('orawls::copydomain',$copy_instances, $default_params)
}
