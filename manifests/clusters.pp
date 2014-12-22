class weblogic::clusters {
  require weblogic::managed_servers
  $default_params = {}
  $cluster_instances = hiera('cluster_instances', {})
  create_resources('wls_cluster',$cluster_instances, $default_params)
 }
