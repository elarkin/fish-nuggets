# fish completion for rbenv

function __fish_rbenv_commands
  rbenv commands
end

function __fish_rbenv_versions
  rbenv versions --bare
end

function __fish_rbenv_needs_command
  set cmd (commandline -opc)
  if [ (count $cmd) -eq 1 -a $cmd[1] = 'rbenv' ]
    return 0
  end
  return 1
end

function __fish_rbenv_using_command
  set cmd (commandline -opc)
  if [ (count $cmd) -gt 1 ]
    if [ $argv[1] = $cmd[2] ]
      return 0
    end
  end
  return 1
end

# rbenv commands 
#complete -f -c rbenv -n '__fish_rbenv_needs_command' -a '(__fish_rbenv_commands)' -d 'rbenv command'
complete -f -c rbenv -n '__fish_rbenv_needs_command' -a 'global' -d 'Set or show the global Ruby version'
complete -f -c rbenv -n '__fish_rbenv_needs_command' -a 'local' -d 'Set or show the local directory-specific Ruby version'
complete -f -c rbenv -n '__fish_rbenv_needs_command' -a 'install' -d 'Install new rubies'
complete -f -c rbenv -n '__fish_rbenv_needs_command' -a 'rehash' -d 'Rehash rbenv shims (run this after installing binaries)'
complete -f -c rbenv -n '__fish_rbenv_needs_command' -a 'version' -d 'Show the current Ruby version'
complete -f -c rbenv -n '__fish_rbenv_needs_command' -a 'versions' -d 'List all Ruby versions known by rbenv'
complete -f -c rbenv -n '__fish_rbenv_needs_command' -a 'which' -d 'Show the full path for the given Ruby command'
complete -f -c rbenv -n '__fish_rbenv_needs_command' -a 'whence' -d 'List all Ruby versions with the given command'

## rbenv set-default
complete -f -c rbenv -n '__fish_rbenv_using_command set-default' -a '(__fish_rbenv_versions)' -d 'Set this ruby as default'
complete -f -c rbenv -n '__fish_rbenv_using_command global' -a '(__fish_rbenv_versions)' -d 'Set this ruby as default'

## rbenv set-local
complete -f -c rbenv -n '__fish_rbenv_using_command set-local' -a '(__fish_rbenv_versions)' -d 'Set this ruby for the current project'
complete -f -c rbenv -n '__fish_rbenv_using_command local' -a '(__fish_rbenv_versions)' -d 'Set this ruby for the current project'

## rbenv install
complete -f -c rbenv -n '__fish_rbenv_using_command install' -a '(ruby-build --definitions)' -d 'Install this ruby'

## rbenv which and whence
complete -f -c rbenv -n '__fish_rbenv_using_command which' -a '(rbenv shims --short)'
complete -f -c rbenv -n '__fish_rbenv_using_command whence' -a '(rbenv shims --short)'
