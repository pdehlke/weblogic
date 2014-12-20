class weblogic::saf_imported_destination {
  require weblogic::saf_error_handlers
  $default_params = {}
  $saf_imported_destination_instances = hiera('saf_imported_destination_instances', {})
  create_resources('wls_saf_imported_destination',$saf_imported_destination_instances, $default_params)
 }
