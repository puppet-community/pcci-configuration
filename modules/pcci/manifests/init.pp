class pcci (
  $github_password = hiera('github_password'),
) {

  file { '/home/pcci/pcci/config.py':
    ensure  => file,
    content => template('pcci/config.py.erb'),
    mode    => '0644',
  }

  file { '/home/pcci/run_workers.sh':
    ensure  => file,
    content => template('pcci/run_workers.sh.erb'),
    mode    => '0755',
  }

}
