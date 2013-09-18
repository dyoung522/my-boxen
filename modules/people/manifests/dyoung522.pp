include people::dyoung522::applications
include people::dyoung522::properties
include people::dyoung522::dotfiles

class people::dyoung522 {
  notify { 'class people::dyoung522 declared': }

  # Changes the default shell to the zsh version we get from Homebrew
  # Uses the osx_chsh type out of boxen/puppet-osx
  osx_chsh { $::boxen_user:
      shell   => '/opt/boxen/homebrew/bin/zsh',
      require => Package['zsh'],
  }

  file_line { 'add zsh to /etc/shells':
      path    => '/etc/shells',
      line    => "${boxen::config::homebrewdir}/bin/zsh",
      require => Package['zsh'],
  }

  # iTerm2 http://www.iterm2.com
  package { 'iTerm2':
    ensure   => installed,
    source   => 'http://www.iterm2.com/downloads/stable/iTerm2_v1_0_0.zip',
    provider => compressed_app
  }

}

