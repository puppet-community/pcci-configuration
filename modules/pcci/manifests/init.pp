class pcci (
  $github_password = hiera('github_password'),
) {

  file { '/home/pcci/pcci/config.py':
    ensure  => file,
    content => template('pcci/config.py.erb'),
    mode    => '0644',
  }

}
