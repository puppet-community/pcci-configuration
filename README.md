# pcci-configuration

Puppet configuration for pcci

Manual steps:

install puppet
install git

modify puppet.conf to remove templatepath

./install_modules.sh
puppet apply --modulepath=/etc/puppet/modules:modules pcci.pp
