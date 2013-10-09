class haveged {

  include haveged::params

  anchor { 'havegeg::begin': }
  -> class { 'haveged::package': }
  -> class { 'haveged::config': }
  -> anchor { 'haveged::end': }
}
