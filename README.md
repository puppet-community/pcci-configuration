# pcci-configuration

Puppet configuration for pcci

Manual steps:

install puppet
install git

./install_modules.sh
puppet apply --modulepath=/etc/puppet/modules:modules pcci.pp
