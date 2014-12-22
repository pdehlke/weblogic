class weblogic::weblogic {
  include orawls::weblogic
  orawls::weblogic {'install' :
    version              => '1211',
    filename             => 'wls1211_generic.jar',
    jdk_home_dir         => '/usr/java/jdk1.7.0_55',
    oracle_base_home_dir => "/opt/oracle",
    middleware_home_dir  => "/opt/oracle/middleware12c",
    os_user              => "weblogic",
    os_group             => "weblogic",
    download_dir         => "/data/install",
    source               => "puppet:///modules/orawls/",
    log_output           => true,
  }
}

