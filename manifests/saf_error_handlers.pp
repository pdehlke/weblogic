class weblogic::saf_error_handlers {
  require weblogic::saf_remote_context_objects
  $default_params = {}
  $saf_error_handler_instances = hiera('saf_error_handler_instances', {})
  create_resources('wls_saf_error_handler',$saf_error_handler_instances, $default_params)
 }
