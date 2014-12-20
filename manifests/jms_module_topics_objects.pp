class weblogic::jms_module_topics_objects {
  require weblogic::jms_module_queues_objects
  $default_params = {}
  $jms_topic_instances = hiera('jms_topic_instances', {})
  create_resources('wls_jms_topic',$jms_topic_instances, $default_params)
 }
