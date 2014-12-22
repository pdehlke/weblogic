class weblogic::properties_files {
  require weblogic::domains

  define weblogic::propsfile (
      $file=$title,
      ) {
    file {"/tmp/$file":
      ensure  => file,
      owner   => root,
      group   => root,
      mode    => '0644',
      source  => 'puppet:///modules/weblogic/conf/$file',
      }
  }

  $default_params = {}
  $conf_instances = hiera_array('conffiles', {})
  create_resources('propsfile',$conf_instances, $default_params)
}
