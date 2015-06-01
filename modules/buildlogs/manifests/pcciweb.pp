# pcciweb
# instantiate the pcciweb web application
class buildlogs::pcciweb (
){

  file { '/www/pcciweb/':
    ensure => directory,
    owner  => 'root',
    group  => 'root',
    mode   => '0755',
  } ->

  vcsrepo { "/www/pcciweb/pcciweb":
    ensure   => latest,
    provider => git,
    owner    => 'www-data',
    source   => 'https://github.com/puppet-community/pcci',
    revision => 'master',
    notify   => Service['apache2'],
  } ->

  python::virtualenv { '/www/pcciweb/pcciweb/venv':
    ensure       => present,
    version      => 'system',
    distribute   => false,
    owner        => 'www-data',
    require      => Vcsrepo['/www/pcciweb/pcciweb'],
  } ->

  python::requirements { '/www/pcciweb/pcciweb/requirements.txt' :
    virtualenv => '/www/pcciweb/pcciweb/venv',
    owner      => 'www-data',
    group      => 'www-data',
  }

}
