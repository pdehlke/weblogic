class weblogic::jms_servers {
  require weblogic::file_persistence
  $default_params = {}
  $jmsserver_instances = hiera('jmsserver_instances', {})
  create_resources('wls_jmsserver',$jmsserver_instances, $default_params)
 }
