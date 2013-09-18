include people::dyoung522::applications
include people::dyoung522::properties
include people::dyoung522::dotfiles

class people::dyoung522 {
  notify { 'class people::dyoung522 declared': }

  # iTerm2 http://www.iterm2.com
  package { 'iTerm2':
    ensure   => installed,
    source   => 'http://www.iterm2.com/downloads/stable/iTerm2_v1_0_0.zip',
    provider => compressed_app
  }

}

