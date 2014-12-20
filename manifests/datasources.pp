class weblogic::datasources {
  require weblogic::managed_servers_channels
  $default_params = {}
  $datasource_instances = hiera('datasource_instances', {})
  create_resources('wls_datasource',$datasource_instances, $default_params)
 }
