class haveged::package {

  $packages = "haveged"

  package { $packages: ensure => installed }

}
