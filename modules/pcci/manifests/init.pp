class pcci (
  $worker_count        = 12,
  $github_password     = hiera('github_password'),
  $github_auth_token   = hiera('github_auth_token'),
  $pcci_retention_days = 30,
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

  # Clean up the aged out PCCI jobs and images to prevent the disk from overflowing.
  cron { 'pcci_job_cleanup':
    command => "/usr/bin/find /tmp -maxdepth 1 -type d -user pcci -mtime +${pcci_retention_days} -name \"pcci*\" -exec rm -fR {} \;",
    user    => root,
    hour    => 1,
    minute  => 0,
  }
  cron { 'pcci_image_cleanup':
    command => "/usr/bin/find /tmp -maxdepth 1 -type f -user root -mtime +${pcci_retention_days} -exec rm -f {} \;",
    user    => root,
    hour    => 2,
    minute  => 0,
  }
}
