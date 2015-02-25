
$packages = [
  'pip',
  'virtualbox',
  'ruby-dev',
]

package { $packages:
  ensure => latest,
}
