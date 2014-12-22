# == Class: class_name
#
# Full description of class example_class here.
#
# === Parameters
#
# Document parameters here.
#
# [*ntp_servers*]
#   Explanation of what this parameter affects and what it defaults to.
#   e.g. "Specify one or more upstream ntp servers as an array."
#
# === Variables
#
# Here you should define a list of variables that this module would require.
#
# [*enc_ntp_servers*]
#   Explanation of how this variable affects the funtion of this class and if it
#   has a default. e.g. "The parameter enc_ntp_servers must be set by the
#   External Node Classifier as a comma separated list of hostnames." (Note,
#   global variables should not be used in preference to class parameters  as of
#   Puppet 2.6.)
#
# === Examples
#
#  class { 'example_class':
#    ntp_servers => [ 'pool.ntp.org', 'ntp.local.company.com' ]
#  }
#
# === Authors
#
# @Author: pde
# @Date:   2014-12-22 07:18:54
#
# === Copyright
#
# Copyright 2015 Above Property LLC unless otherwise noted.
#
# === Metadata
# @Last Modified by:   pde
# @Last Modified time: 2014-12-22 07:55:32

class weblogic::os {

  $default_params = {}
  $host_instances = hiera('hosts', {})
  create_resources('host',$host_instances, $default_params)

  # exec { "create swap file":
  #   command => "/bin/dd if=/dev/zero of=/var/swap.1 bs=1M count=8192",
  #   creates => "/var/swap.1",
  # }

  # exec { "attach swap file":
  #   command => "/sbin/mkswap /var/swap.1 && /sbin/swapon /var/swap.1",
  #   require => Exec["create swap file"],
  #   unless => "/sbin/swapon -s | grep /var/swap.1",
  # }

  # #add swap file entry to fstab
  # exec {"add swapfile entry to fstab":
  #   command => "/bin/echo >>/etc/fstab /var/swap.1 swap swap defaults 0 0",
  #   require => Exec["attach swap file"],
  #   user => root,
  #   unless => "/bin/grep '^/var/swap.1' /etc/fstab 2>/dev/null",
  # }

  service { iptables:
        enable    => false,
        ensure    => false,
        hasstatus => true,
  }

  group { 'weblogic' :
    ensure => present,
  }

  # http://raftaman.net/?p=1311 for generating password
  # password = oracle
  user { 'weblogic' :
    ensure     => present,
    groups     => 'weblogic',
    shell      => '/bin/bash',
    password   => '$1$DSJ51vh6$4XzzwyIOk6Bi/54kglGk3.',
    home       => "/home/weblogic",
    comment    => 'wls user created by Puppet',
    managehome => true,
    require    => Group['weblogic'],
  }

  $install = [ 'binutils.x86_64','unzip.x86_64']


  package { $install:
    ensure  => present,
  }

  class { 'limits':
    config => {
               '*'       => {  'nofile'  => { soft => '2048'   , hard => '8192',   },},
               'weblogic'  => {  'nofile'  => { soft => '65536'  , hard => '65536',  },
                               'nproc'   => { soft => '2048'   , hard => '16384',   },
                               'memlock' => { soft => '1048576', hard => '1048576',},
                               'stack'   => { soft => '10240'  ,},},
               },
    use_hiera => false,
  }

  sysctl { 'kernel.msgmnb':                 ensure => 'present', permanent => 'yes', value => '65536',}
  sysctl { 'kernel.msgmax':                 ensure => 'present', permanent => 'yes', value => '65536',}
  sysctl { 'kernel.shmmax':                 ensure => 'present', permanent => 'yes', value => '2588483584',}
  sysctl { 'kernel.shmall':                 ensure => 'present', permanent => 'yes', value => '2097152',}
  sysctl { 'fs.file-max':                   ensure => 'present', permanent => 'yes', value => '6815744',}
  sysctl { 'net.ipv4.tcp_keepalive_time':   ensure => 'present', permanent => 'yes', value => '1800',}
  sysctl { 'net.ipv4.tcp_keepalive_intvl':  ensure => 'present', permanent => 'yes', value => '30',}
  sysctl { 'net.ipv4.tcp_keepalive_probes': ensure => 'present', permanent => 'yes', value => '5',}
  sysctl { 'net.ipv4.tcp_fin_timeout':      ensure => 'present', permanent => 'yes', value => '30',}
  sysctl { 'kernel.shmmni':                 ensure => 'present', permanent => 'yes', value => '4096', }
  sysctl { 'fs.aio-max-nr':                 ensure => 'present', permanent => 'yes', value => '1048576',}
  sysctl { 'kernel.sem':                    ensure => 'present', permanent => 'yes', value => '250 32000 100 128',}
  sysctl { 'net.ipv4.ip_local_port_range':  ensure => 'present', permanent => 'yes', value => '9000 65500',}
  sysctl { 'net.core.rmem_default':         ensure => 'present', permanent => 'yes', value => '262144',}
  sysctl { 'net.core.rmem_max':             ensure => 'present', permanent => 'yes', value => '4194304', }
  sysctl { 'net.core.wmem_default':         ensure => 'present', permanent => 'yes', value => '262144',}
  sysctl { 'net.core.wmem_max':             ensure => 'present', permanent => 'yes', value => '1048576',}

 }
