# Puppet manifest for vpci host
# VPCI is the voxpupuli ci, a second generation pcci

include ::admins

# Setup an OpenStack nodepool for testing

file { '/etc/nodepool/nodepool.yaml':
  ensure  => present,
  source  => '/root/pcci-configuration/files/nodepool.yaml',
  owner   => 'nodepool',
  group   => 'root',
  mode    => '0400',
  require => [
    File['/etc/nodepool'],
    User['nodepool'],
  ],
}

file { '/home/nodepool/.config':
  ensure  => directory,
  owner   => 'nodepool',
  group   => 'nodepool',
  require => [
    User['nodepool'],
  ],
}

file { '/home/nodepool/.config/openstack':
  ensure  => directory,
  owner   => 'nodepool',
  group   => 'nodepool',
  require => [
    File['/home/nodepool/.config'],
  ],
}

# Note, setup this file's content out of band
# Else set up hiera file backend
file { '/home/nodepool/.config/openstack/clouds.yaml':
  ensure  => present,
  owner   => 'nodepool',
  group   => 'nodepool',
  mode    => '0400',
  require => [
    File['/home/nodepool/.config/openstack'],
    User['nodepool'],
  ],
}

file { '/home/nodepool/.ssh/id_rsa.pub':
  ensure  => present,
  owner   => 'nodepool',
  group   => 'nodepool',
  mode    => '0400',
  content => hiera('nodepool_ssh_public_key'),
  require => [
    Class['nodepool'],
  ],
}


class { '::nodepool':
  mysql_root_password      => hiera("mysql_root_password"),
  mysql_password           => hiera("mysql_password"),
  nodepool_ssh_private_key => hiera('nodepool_ssh_private_key'),
}

