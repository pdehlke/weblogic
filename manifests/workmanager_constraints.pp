class weblogic::workmanager_constraints {
  require weblogic::virtual_hosts
  $default_params = {}
  $workmanager_constraint_instances = hiera('workmanager_constraint_instances', {})
  create_resources('wls_workmanager_constraint',$workmanager_constraint_instances, $default_params)
 }
