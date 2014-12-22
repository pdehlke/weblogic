class weblogic::jms_module_queues_objects {
  require weblogic::jms_module_cfs
  $default_params = {}
  $jms_queue_instances = hiera('jms_queue_instances', {})
  create_resources('wls_jms_queue',$jms_queue_instances, $default_params)
 }
