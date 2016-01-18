# == Define: admins::key
# 
# This is a wraper ssh_authorized_key to authorize both, the root and pcci user
#
define admins::key (
    $key,
    $ensure = 'present',
    $type   = 'ssh-rsa',
) {

  ssh_authorized_key { "${title}-pcci":
    ensure => $ensure,
    user   => 'pcci',
    type   => $type,
    key    => $key
  }

  ssh_authorized_key { "${title}-root":
    ensure => $ensure,
    user   => 'root',
    type   => $type,
    key    => $key
  }
}
