class weblogic::workmanagers {
  require weblogic::workmanager_constraints
  $default_params = {}
  $workmanager_instances = hiera('workmanager_instances', {})
  create_resources('wls_workmanager',$workmanager_instances, $default_params)
 }
