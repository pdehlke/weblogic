# == Class: weblogic::weblogic
#
# Installs WebLogic using biemond-weblogic. This class should be refactored
# and the variables placed in hiera.
#
# === Parameters
#
# === Variables
#
# === Examples
#
#  class { 'weblogic::weblogic':}
#
# === Authors
#
# @Author: pde
# @Date:   2014-12-23 05:17:48
# @Last Modified by:   pde
# @Last Modified time: 2014-12-23 06:25:57
#
# === Copyright
#
# Copyright 2015 Above Property LLC, unless otherwise noted.
#
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

