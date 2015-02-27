
$packages = [
  'bundler',
  'git',
  'htop',
  'libxslt-dev',
  'puppet',
  'python-pip',
  'python-virtualenv',
  'ruby-dev',
  'tmux',
  'vim',
  'virtualbox',
  'zlib1g-dev',
]

package { $packages:
  ensure => latest,
}

user { 'pcci':
  ensure     => present,
  shell      => '/bin/bash',
  managehome => true,
} ->

file { '/home/pcci/.ssh':
  ensure => directory,
  owner  => 'pcci',
  mode   => '0700',
}

file { '/home/pcci/.hushlogin':
  ensure => file,
  owner  => 'pcci',
  mode   => '0644',
}

include 'admins'

vcsrepo { '/opt/pcci':
  ensure   => latest,
  provider => git,
  revision => 'master',
  source   => 'https://github.com/puppet-community/pcci.git',
}

vcsrepo { '/root/pcci-configuration':
  ensure   => latest,
  provider => git,
  revision => 'master',
  source   => 'https://github.com/puppet-community/pcci-configuration.git',
}

include 'archive'

archive { '/opt/vagrant_1.6.5_x86_64.deb':
  ensure        => present,
  source   => 'https://dl.bintray.com/mitchellh/vagrant/vagrant_1.6.5_x86_64.deb',
  checksum      => '4989d576565cb4a0fccda2e5a08d48bb859a3955',
  checksum_type => 'sha1',
} ->

package { 'vagrant':
  ensure   => present,
  provider => 'dpkg',
  source   => '/opt/vagrant_1.6.5_x86_64.deb',
}

file { '/etc/puppet/hiera.yaml':
  ensure => link,
  target => '/etc/hiera.yaml',
}

class { 'redis':
  redis_bind_address => '127.0.0.1',
}

include buildlogs
include pcci

class { 'ssh::server':
  options => {
    'PasswordAuthentication' => 'no',
    'PermitRootLogin'        => 'without-password',
  },
}
