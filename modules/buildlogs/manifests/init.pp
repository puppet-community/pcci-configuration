class buildlogs () {

  include httpd

  file { '/srv/static':
    ensure => directory,
    owner  => 'www-data',
    mode   => '0755',
  }

  file { '/srv/static/logs':
    ensure => directory,
    owner  => 'www-data',
    mode   => '0755',
  }

  httpd::vhost { 'planck.nibalizer.com':
    port     => 80, 
    priority => '50',
    docroot  => '/srv/static/logs',
    require  => File['/srv/static/logs'],
    template => 'buildlogs/buildlogs.vhost.erb',
  }


}
