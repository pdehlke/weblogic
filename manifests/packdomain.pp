class weblogic::packdomain {
  require weblogic::startwls

  $default_params = {}
  $pack_domain_instances = hiera('pack_domain_instances', {})
  create_resources('orawls::packdomain',$pack_domain_instances, $default_params)

}
