# == Class: weblogic::fmw
#
# Wrapper around biemond-orawls::fmw.
#
# === Parameters
#
# === Variables
#
# === Examples
#
#  class { 'weblogic::fmw':}
#
# === Authors
#
# @Author: pde
# @Date:   2014-12-23 05:17:48
# @Last Modified by:   pde
# @Last Modified time: 2014-12-23 08:46:35
#
# === Copyright
#
# Copyright 2015 Above Property LLC, unless otherwise noted.
#
class weblogic::fmw {
  require weblogic::bsu
  $default_params = {}
  $fmw_installations = hiera('fmw_installations', {})
  create_resources('orawls::fmw',$fmw_installations, $default_params)
 }
