class people::dyoung522::packages {

  # Package definitions

  # iTerm2 http://www.iterm2.com
  package { 'iterm2':
    ensure   => installed,
    source   => 'http://www.iterm2.com/downloads/stable/iTerm2_v1_0_0.zip',
    provider => compressed_app,
  }
}

