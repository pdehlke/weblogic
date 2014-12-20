class weblogic::startwls {
  require orawls::weblogic,weblogic::domains,weblogic::nodemanager

  $default_params = {}
  $control_instances = hiera('control_instances', {})
  create_resources('orawls::control',$control_instances, $default_params)
 }
