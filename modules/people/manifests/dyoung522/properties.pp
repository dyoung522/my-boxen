class people::dyoung522::properties {

  $my_homedir = "/Users/${::boxen_user}"

  # Disable Gatekeeper so you can install any package you want
  property_list_key { 'Disable Gatekeeper':
    ensure => present,
    path   => '/var/db/SystemPolicy-prefs.plist',
    key    => 'enabled',
    value  => 'no',
  }

  # NOTE: Dock prefs only take effect when you restart the dock
  property_list_key { 'Hide the dock':
    ensure     => present,
    path       => "${my_homedir}/Library/Preferences/com.apple.dock.plist",
    key        => 'autohide',
    value      => true,
    value_type => 'boolean',
    notify     => Exec['Restart the Dock'],
  }

  property_list_key { 'Align the Dock Left':
    ensure     => present,
    path       => "${my_homedir}/Library/Preferences/com.apple.dock.plist",
    key        => 'orientation',
    value      => 'left',
    notify     => Exec['Restart the Dock'],
  }

  property_list_key { 'Lower Right Hotcorner - Screen Saver':
    ensure     => present,
    path       => "${my_homedir}/Library/Preferences/com.apple.dock.plist",
    key        => 'wvous-br-corner',
    value      => 10,
    value_type => 'integer',
    notify     => Exec['Restart the Dock'],
  }

  property_list_key { 'Lower Right Hotcorner - Screen Saver - modifier':
    ensure     => present,
    path       => "${my_homedir}/Library/Preferences/com.apple.dock.plist",
    key        => 'wvous-br-modifier',
    value      => 0,
    value_type => 'integer',
    notify     => Exec['Restart the Dock'],
  }

  exec { 'Restart the Dock':
    command     => '/usr/bin/killall -HUP Dock',
    refreshonly => true,
  }

  file { 'Dock Plist':
    ensure  => file,
    require => [
      Property_list_key['Hide the dock'],
      Property_list_key['Lower Right Hotcorner - Screen Saver'],
      Property_list_key['Lower Right Hotcorner - Screen Saver - modifier']
    ],
    path    => "${my_homedir}/Library/Preferences/com.apple.dock.plist",
    mode    => '0600',
    notify     => Exec['Restart the Dock'],
  }
}


