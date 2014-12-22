class weblogic::managed_servers_channels {
  require weblogic::managed_servers
  $default_params = {}
  $server_channel_instances = hiera('server_channel_instances', {})
  create_resources('wls_server_channel',$server_channel_instances, $default_params)
 }
