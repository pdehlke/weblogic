class weblogic::virtual_hosts {
  require weblogic::clusters
  $default_params = {}
  $virtual_host_instances = hiera('virtual_host_instances', {})
  create_resources('wls_virtual_host',$virtual_host_instances, $default_params)
 }
