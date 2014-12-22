class weblogic::libs {
  require weblogic::domains

  $default_params = {}
  $lib_instances = hiera('libdir', {})
  create_resources('file',$lib_instances, $default_params)
}
