class weblogic::pack_domain {
  require weblogic::saf_imported_destination_objects
  $default_params = {}
  $pack_domain_instances = hiera('pack_domain_instances', $default_params)
  create_resources('orawls::packdomain',$pack_domain_instances, $default_params)
 }
