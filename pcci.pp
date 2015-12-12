
$packages = [
  'bundler',
  'debootstrap',
  'git',
  'htop',
  'qemu-kvm',
  'cpu-checker',
  'libxslt-dev',
  'libyaml-dev',
  'puppet',
  'python-pip',
  'python-dev',
  'python-virtualenv',
  'ruby-dev',
  'qemu-utils',
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

class { 'pcci':
  worker_count => 28,
}

class { 'ssh::server':
  options => {
    'PasswordAuthentication' => 'no',
    'PermitRootLogin'        => 'without-password',
  },
}

class { '::ntp':
  servers   => ['3.pool.ntp.org', '2.us.pool.ntp.org', '0.de.pool.ntp.org'],
  restrict  => [
    'default ignore',
    '-6 default ignore',
    '127.0.0.1',
    '-6 ::1',
    '3.pool.ntp.org nomodify notrap nopeer noquery',
    '2.us.pool.ntp.org nomodify notrap nopeer noquery',
    '0.de.pool.ntp.org nomodify notrap nopeer noquery',
  ],
}
