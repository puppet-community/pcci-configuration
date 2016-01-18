class { '::nodepool':
  mysql_root_password => hiera("mysql_root_password"),
  mysql_password => hiera("mysql_password"),

}

include ::admins
