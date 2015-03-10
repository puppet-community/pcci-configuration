# pcci-configuration

Puppet configuration for pcci

Manual steps:

install puppet
install git

modify puppet.conf to remove templatepath

./install_modules.sh

To run for in noop mode:
puppet apply --modulepath=/etc/puppet/modules:modules --noop pcci.pp

To run for real:
puppet apply --modulepath=/etc/puppet/modules:modules pcci.pp
