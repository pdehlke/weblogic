class weblogic::groups {
  require weblogic::users
  $default_params = {}
  $group_instances = hiera('group_instances', {})
  create_resources('wls_group',$group_instances, $default_params)
 }
