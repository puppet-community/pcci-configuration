
$packages = [
  'python-pip',
  'virtualbox',
  'ruby-dev',
  'tmux',
  'vim',
  'git',
  'puppet',
]

package { $packages:
  ensure => latest,
}


user { 'pcci':
  ensure     => present,
  managehome => true,
} ->

file { '/home/pcci/.ssh':
  ensure => directory,
  owner  => 'pcci',
  mode   => '0700',
}

include 'admins'

vcsrepo { '/opt/pcci':
  ensure   => latest,
  provider => git,
  revision => 'master',
  source   => 'https://github.com/nibalizer/pcci.git',
}

vcsrepo { '/root/pcci-configuration':
  ensure   => latest,
  provider => git,
  revision => 'master',
  source   => 'https://github.com/nibalizer/pcci-configuration.git',
}


staging::file { '/opt/vagrant_1.7.2_x86_64.deb':
  source   => 'https://dl.bintray.com/mitchellh/vagrant/vagrant_1.7.2_x86_64.deb',
} ->

package { 'vagrant':
  ensure   => present,
  provider => 'dpkg',
  source   => '/opt/vagrant_1.7.2_x86_64.deb',
}

file { '/etc/puppet/hiera.yaml':
  ensure => file,
}

class { 'redis':
  redis_bind_address => '127.0.0.1',
}
