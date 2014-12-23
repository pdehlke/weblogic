# == Class: weblogic::opatch
#
# Wrapper around biemond-orawls::opatch. Installs oracle Opatches.
#
# === Parameters
#
# === Variables
#
# === Examples
#
#  class { 'weblogic::opatch':}
#
# in hiera:
#
# opatch_instances:
#   '16175470':
#      ensure:                   "present"
#      oracle_product_home_dir:  "/opt/oracle/middleware12c"
#      patch_id:                 "16175470"
#      patch_file:               "p16175470_121200_Generic.zip"
#      jdk_home_dir              "/usr/java/jdk1.7.0_45"
#      os_user:                  "oracle"
#      os_group:                 "dba"
#      download_dir:             "/data/install"
#      source:                   "/vagrant"
#      log_output:               true
#
# === Authors
#
# @Author: pde
# @Date:   2014-12-23 05:17:48
# @Last Modified by:   pde
# @Last Modified time: 2014-12-23 07:56:57
#
# === Copyright
#
# Copyright 2015 Above Property LLC, unless otherwise noted.
#
class weblogic::opatch {
  require weblogic::fmw,weblogic::bsu,orawls::weblogic
  $default_params = {}
  $opatch_instances = hiera('opatch_instances', {})
  create_resources('orawls::opatch',$opatch_instances, $default_params)
 }
