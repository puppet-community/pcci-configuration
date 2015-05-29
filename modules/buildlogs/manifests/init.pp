class buildlogs () {

  include httpd

  file { '/var/www/html/buildlogs':
    ensure => directory,
    owner  => 'pcci',
    mode   => '0755',
  }

  httpd::vhost { 'ci.puppet.community':
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

  package { 'libapache2-mod-wsgi':
    ensure   => 'latest',
  }

  package { 'keyring':
    ensure   => 'latest',
    provider => 'pip',
  }

}
