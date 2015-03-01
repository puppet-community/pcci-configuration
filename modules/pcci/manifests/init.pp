class pcci (
  $github_password = hiera('github_password'),
) {

  file { '/home/pcci/pcci/config.py':
    ensure  => file,
    content => template('pcci/config.py.erb'),
    mode    => '0644',
  }

  file { '/home/pcci/run_worker.sh':
    ensure  => file,
    content => template('pcci/run_workers.sh.erb'),
    mode    => '0755',
  }

  file { '/home/pcci/test_worker_count.sh':
    ensure  => file,
    content => template('pcci/test_worker_count.sh.erb'),
    mode    => '0755',
  }

}
