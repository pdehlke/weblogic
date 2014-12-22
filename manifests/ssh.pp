class weblogic::ssh {
  require os


  file { "/home/weblogic/.ssh/":
    owner  => "weblogic",
    group  => "weblogic",
    mode   => "700",
    ensure => "directory",
    alias  => "weblogic-ssh-dir",
  }

  file { "/home/weblogic/.ssh/id_rsa.pub":
    ensure  => present,
    owner   => "weblogic",
    group   => "weblogic",
    mode    => "644",
    source  => "puppet:///modules/weblogic/id_rsa.pub",
    require => File["weblogic-ssh-dir"],
  }

  file { "/home/weblogic/.ssh/id_rsa":
    ensure  => present,
    owner   => "weblogic",
    group   => "weblogic",
    mode    => "600",
    source  => "puppet:///modules/weblogic/id_rsa",
    require => File["weblogic-ssh-dir"],
  }

  file { "/home/weblogic/.ssh/authorized_keys":
    ensure  => present,
    owner   => "weblogic",
    group   => "weblogic",
    mode    => "644",
    source  => "puppet:///modules/weblogic/id_rsa.pub",
    require => File["weblogic-ssh-dir"],
  }
 }
