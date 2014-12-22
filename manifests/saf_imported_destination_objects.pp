class weblogic::saf_imported_destination_objects {
  require weblogic::saf_imported_destination
  $default_params = {}
  $saf_imported_destination_object_instances = hiera('saf_imported_destination_object_instances', {})
  create_resources('wls_saf_imported_destination_object',$saf_imported_destination_object_instances, $default_params)
 }
