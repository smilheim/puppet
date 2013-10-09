class haveged::config {

  include haveged
  
  exec { "/bin/sed -i 's/-w 1024/-w 4096/g' $haveged::params::configfile":
    onlyif => "/bin/grep 1024 $haveged::params::configfile",
    notify => Service["haveged"], 
  } 

  service { "haveged":
    ensure => "running",
    enable => "true",
  }
}
