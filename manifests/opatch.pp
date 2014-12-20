class weblogic::opatch {
  require weblogic::fmw,weblogic::bsu,orawls::weblogic
  $default_params = {}
  $opatch_instances = hiera('opatch_instances', {})
  create_resources('orawls::opatch',$opatch_instances, $default_params)
 }
