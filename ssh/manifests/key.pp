# Definition: ssh::key
# ==Actions
# Manage ssh keys for specified user
#
# Sample Usage:
#   ssh::key { "username":
#   user => "root",  # User to apply the key to
#   sshkey => "Your full SSH key",
#    revoke => "true",  # if true will revoke key, default is false
#  }
#

define ssh::key (
  $user    = "root",
  $sshkey = "UNSET",
  $revoke  = "false"
) {
  include ssh

  if $user == "root" {
    $home = "/root"
  } else {
    $home = "/home/${user}"
  }
  $filename = "$home/.ssh/authorized_keys"

  if $revoke == 'true' {
    exec { "/bin/sed -i '/${sshkey}/d' ${filename}":
      onlyif => "/bin/grep ${title} ${filename}",
    }
  } else {
    exec { "/bin/echo ${sshkey} >> ${filename}":
      unless => "/bin/grep ${title} ${filename}",
    }
  } 
}
