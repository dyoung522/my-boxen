class people::dyoung522::dotfiles {

  $my_homedir  = "/Users/${::boxen_user}"
  $my_dotfiles = "${my_homedir}/.dotfiles"

  repository { "${my_dotfiles}":
    source => 'dyoung522/dotfiles',
  }

  file { "${my_homedir}/.zsh":
    ensure  => link,
    mode    => '0644',
    target  => "${my_dotfiles}/zsh",
    require => Repository["${my_dotfiles}"],
  }

  file { "${my_homedir}/.tmux.conf":
    ensure  => link,
    mode    => '0644',
    target  => "${my_dotfiles}/tmux.conf",
    require => Repository["${my_dotfiles}"],
  }

  file { "${my_homedir}/.zshrc":
    ensure  => link,
    mode    => '0644',
    target  => "${my_dotfiles}/zshrc",
    require => Repository["${my_dotfiles}"],
  }

  file { "${my_homedir}/.vimrc":
    ensure => link,
    mode   => '0644',
    target => "${my_dotfiles}/vimrc",
    require => Repository["${my_dotfiles}"],
  }
}
