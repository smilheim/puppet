class haveged::params {

  case $::operatingsystem { 
    Ubuntu: {
      $configfile	= '/etc/default/haveged'
    } 
    SLES: {
      case $::operatingsystemrelease {
        '11.1', '11.2': { 
          $configfile	= '/etc/init.d/haveged'
        }
      }
    }
    default: {
      fail("The ${module_name} is not supported on ${operatingsystem}${operatingsystemrelease}.")
    }
  }
}
