class people::dyoung522::dotfiles {

  $my_homedir  = "/Users/${::boxen_user}"
  $my_dotfiles = "${my_homedir}/.dotfiles"

  repository { "${my_dotfiles}":
    source => 'dyoung522/dotfiles',
  }

  exec { "bootstrap dotfiles":
    command => "cd ${my_homedir}; ${my_dotfiles}/script/install",
    require => Repository["${my_dotfiles}"],
  }
}

