# == Class: weblogic::libs
#
# Copies extra libraries and other files into a WebLogic domain
# directory. Gets file locations, sourecs, and other variables
# from hiera. Simple implementation of a puppet File type; all File
# variables can be supplied in the hiera definition. Be sure to correctly
# set owner and group, or WebLogic may be unable to configure itself at runtime.
#
# Properties files should be templatized to avoid duplication on the puppet master.
#
# === Parameters
#
# === Variables
#
# === Examples
#
#  class { 'weblogic::libs':}
#
# in hiera:
#
# libdir:
#     '/opt/oracle/wlsdomains/domains/qaua1Domain/lib':
#       source:    'puppet:///modules/weblogic/lib'
#       recurse:   'true'
#       owner:     'weblogic'
#       group:     'weblogic'
#     '/opt/oracle/wlsdomains/domains/qaua1Domain':
#       source:   'puppet:///modules/weblogic/conf'
#       recurse:  'true'
#       owner:    'weblogic'
#       group:    'weblogic'
#
# Note that most of these values should be inherited from existing hiera
# aliases (*wls_os_user, *wls_os_group, etc)
# === Authors
#
# @Author: pde
# @Date:   2014-12-23 05:17:55
# @Last Modified by:   pde
# @Last Modified time: 2014-12-23 07:26:58
#
# === Copyright
#
# Copyright 2015 Above Property LLC, unless otherwise noted.
#
class weblogic::libs {
  require weblogic::domains

  $default_params = {}
  $lib_instances = hiera('libdir', {})
  create_resources('file',$lib_instances, $default_params)
}
