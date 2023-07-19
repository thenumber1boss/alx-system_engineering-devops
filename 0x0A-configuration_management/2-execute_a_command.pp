# create a manifest that kills a process named killmenow
# using pkill with puppet
exec { 'killmenow':
  command     => 'pkill -f killmenow',
  path        => '/usr/bin:/bin',  # Set appropriate paths for pkill
  onlyif      => 'pgrep -f killmenow',  # Check if the process exists before attempting to kill it
  refreshonly => true,  # Ensure the command only runs when explicitly refreshed
  logoutput   => true,  # Log the output of the command for troubleshooting
}

