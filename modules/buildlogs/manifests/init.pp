class buildlogs () {

  include httpd

  file { '/var/www/html/buildlogs':
    ensure => directory,
    owner  => 'pcci',
    mode   => '0755',
  }

  httpd::vhost { 'planck.nibalizer.com':
    port               => 80, 
    priority           => '50',
    docroot            => '/var/www/html',
    require            => File['/var/www/html/buildlogs'],
    template           => 'buildlogs/buildlogs.vhost.erb',
    configure_firewall => false,
  }

  httpd_mod { 'rewrite':
    ensure => present,
  }
  httpd_mod { 'proxy':
    ensure => present,
  }
  httpd_mod { 'wsgi':
    ensure => present,
  }
  httpd_mod { 'proxy_http':
    ensure => present,
  }

  $swift_authurl  = ""

  package { 'httpd-wsgi':
    ensure   => 'latest',
  }

  package { 'keyring':
    ensure   => 'latest',
    provider => 'pip',
  }

  vcsrepo { '/opt/os-loganalyze':
    ensure   => latest,
    provider => git,
    revision => 'master',
    source   => 'https://git.openstack.org/openstack-infra/os-loganalyze',
    require  => Package['keyring'],
  }

  exec { 'install_os-loganalyze':
    command     => 'python setup.py install',
    cwd         => '/opt/os-loganalyze',
    path        => '/bin:/usr/bin',
    refreshonly => true,
    subscribe   => Vcsrepo['/opt/os-loganalyze'],
  }

  file { '/etc/os_loganalyze':
    ensure  => directory,
    owner   => 'root',
    group   => 'root',
    mode    => '0755',
    require => Vcsrepo['/opt/os-loganalyze'],
  }

  file { '/etc/os_loganalyze/wsgi.conf':
    ensure  => present,
    owner   => 'root',
    group   => 'www-data',
    mode    => '0440',
    content => template('buildlogs/os-loganalyze-wsgi.conf.erb'),
    require => File['/etc/os_loganalyze'],
  }


}
