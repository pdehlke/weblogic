class weblogic::managed_servers {
  require weblogic::machines
  $default_params = {}
  $server_instances = hiera('server_instances', {})
  create_resources('wls_server',$server_instances, $default_params)
 }
