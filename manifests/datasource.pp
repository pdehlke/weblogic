class weblogic::datasource {

  require orawls::weblogic, weblogic::domain

  $default_params = {}
  $datasource_instances = hiera('datasource_instances', {})
  create_resources('wls_datasource',$datasource_instances, $default_params)
}

