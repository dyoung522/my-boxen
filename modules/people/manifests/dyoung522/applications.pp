class people::dyoung522::applications {
  # iTerm2 http://www.iterm2.com
  package { 'iterm2':
    ensure   => installed,
    source   => 'http://www.iterm2.com/downloads/stable/iTerm2_v1_0_0.zip',
    provider => compressed_app,
  }

  include zsh
  include vim
#  include macvim
#  include postgresql
#  include dropbox
  #include alfred
  #include rubymine
  #include sourcetree
  #include onepassword
  #include heroku
  #include foreman
}

