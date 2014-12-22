class weblogic::nodemanager {
  require orawls::weblogic, weblogic::domains

  $default_params = {}
  $nodemanager_instances = hiera('nodemanager_instances', {})
  create_resources('orawls::nodemanager',$nodemanager_instances, $default_params)

  orautils::nodemanagerautostart{"autostart weblogic 11g":
    version                 => hiera('wls_version'),
    wlHome                  => hiera('wls_weblogic_home_dir'),
    user                    => hiera('wls_os_user'),
    jsseEnabled             => hiera('wls_jsse_enabled'             ,false),
    customTrust             => hiera('wls_custom_trust'             ,false),
    trustKeystoreFile       => hiera('wls_trust_keystore_file'      ,undef),
    trustKeystorePassphrase => hiera('wls_trust_keystore_passphrase',undef),
  }

 }
