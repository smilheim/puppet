# Manage ssh keys for specified user

 Sample Usage:
   ssh::key { "username":
   user => "root",  # User to apply the key to
   sshkey => "Your full SSH key",
    revoke => "true",  # if true will revoke key, default is false
  }

