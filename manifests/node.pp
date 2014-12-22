class weblogic::node {

  include weblogic::os
  include weblogic::ssh
  include weblogic::java
  include orawls::weblogic
  include orautils
  include weblogic::bsu
  include weblogic::copydomain
  include weblogic::nodemanager

  Class[weblogic::os] -> Class['weblogic::java'] -> Class['orawls::weblogic']
}
