class weblogic::clusters {
  require weblogic::datasources
  $default_params = {}
  $cluster_instances = hiera('cluster_instances', {})
  create_resources('wls_cluster',$cluster_instances, $default_params)
 }
