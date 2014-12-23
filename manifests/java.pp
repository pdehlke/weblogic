# == Class: weblogic::java
#
# Installs a jdk in /usr/java and sets it as the default. Installs
# /etc/profile.d/java to set $JAVA_HOME and $PATH globally.
#
# === Parameters
#
# This class is a simple wrapper around biemond-jdk7. It should be
# refactored to make use of hiera.
#
# === Variables
#
# === Examples
#
#  class { 'weblogic::java':}
#
# === Authors
#
# @Author: pde
# @Date:   2014-12-23 05:17:55
# @Last Modified by:   pde
# @Last Modified time: 2014-12-23 06:13:35
#
# === Copyright
#
# Copyright 2015 Above Property LLC, unless otherwise noted.
#
class weblogic::java {
   require os

  $remove = [ "java-1.7.0-openjdk.x86_64", "java-1.6.0-openjdk.x86_64" ]

  package { $remove:
    ensure  => absent,
  }

  include jdk7

  jdk7::install7{ 'jdk1.7.0_55':
      version                   => "7u55" ,
      fullVersion               => "jdk1.7.0_55",
      alternativesPriority      => 18000,
      x64                       => true,
      downloadDir               => "/var/tmp/install",
      urandomJavaFix            => true,
      rsakeySizeFix             => true,
      cryptographyExtensionFile => "UnlimitedJCEPolicyJDK7.zip",
  }

  file {'/etc/profile.d/java.sh':
    ensure => present,
    content => "export JAVA_HOME=/usr/java/latest\nexport PATH=\${PATH}:\${JAVA_HOME}/bin\n"
  }

}
