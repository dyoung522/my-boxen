class people::dyoung522::dotfiles {

  $my_homedir  = "/Users/${::boxen_user}"
  $my_dotfiles = "${my_homedir}/.dotfiles"

  notify { "After the run, don't forget to run script/install from the .dotfiles directory": }

  repository { "${my_dotfiles}":
    source => 'dyoung522/dotfiles',
  }

#  exec { "install dotfiles":
#    command => "cd ${my_dotfiles}; script/install",
#    require => Repository["${my_dotfiles}"],
#  }

  # We're just going to symlink the important files for now, after that we can
  # run our installer from the command line
  file { "${my_homedir}/.zshrc":
    ensure  => link,
    mode    => '0644',
    target  => "${my_dotfiles}/zsh/zshrc.symlink",
    require => Repository["${my_dotfiles}"],
  }

  file { "${my_homedir}/bin":
    ensure  => link,
    mode    => '0644',
    target  => "${my_dotfiles}/bin",
    require => Repository["${my_dotfiles}"],
  }
}

