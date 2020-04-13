#!/bin/bash

# copied from https://github.com/mpapis/bash_zsh_support/tree/master/chpwd
function __zsh_like_cd()
{
  \typeset __zsh_like_cd_hook
  if
    builtin "$@"
  then
    for __zsh_like_cd_hook in chpwd "${chpwd_functions[@]}"
    do
      if \typeset -f "$__zsh_like_cd_hook" >/dev/null 2>&1
      then "$__zsh_like_cd_hook" || break # finish on first failed hook
      fi
    done
    true
  else
    return $?
  fi
}

[[ -n "${ZSH_VERSION:-}" ]] ||
{
  function cd()    { __zsh_like_cd cd    "$@" ; }
  function popd()  { __zsh_like_cd popd  "$@" ; }
  function pushd() { __zsh_like_cd pushd "$@" ; }
}

_load_nodeversion() {
  if [[ -f .nvmrc && -r .nvmrc ]]; then
    nvm use
  elif [[ -f package.json && -r package.json ]]; then
    NODE_VERSION_STRING=$(node -p -e "require('./package.json').engines && require('./package.json').engines.node")
    if [[ "$NODE_VERSION_STRING" = "undefined" || "$NODE_VERSION_STRING" = "" || "$NODE_VERSION_STRING" = "{}" ]]; then
      echo "engines.versions is not defined. Using default node version"
      nvm use default
    else
      NODE_VERSION=$(echo $NODE_VERSION_STRING | grep -m 1 -o '\([0-9]\+\.\{0,1\}\)\+')
      nvm use $NODE_VERSION || (echo "Version $NODE_VERSION is not yet installed." && nvm install $NODE_VERSION) || (echo "Something went wrong when trying to use $NODE_VERSION. Using your default version for now" && nvm use default)
    fi
  elif [[ $(nvm version) != $(nvm version default)  ]]; then
    echo "Reverting to nvm default version"
    nvm use default
  fi
}
export -a chpwd_functions                              		     # define hooks as an shell array
 [[ " ${chpwd_functions[*]} " == *" _load_nodeversion "* ]] || # prevent double addition
 chpwd_functions+=(_load_nodeversion)                          # finally add it to the list