class weblogic::users {
  require weblogic::userconfig
  $default_params = {}
  $user_instances = hiera('user_instances', {})
  create_resources('wls_user',$user_instances, $default_params)
 }
