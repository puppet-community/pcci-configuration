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


}
