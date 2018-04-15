[ -r /usr/share/bash-completion/bash_completion   ] && . /usr/share/bash-completion/bash_completion

# JS enviroment
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


# PYTHON manage.py command
function pm(){
  $(find ./ -name manage.py) $@
}

[[ -f $HOME/.pythonrc ]] && export PYTHONSTARTUP="$HOME/.pythonrc"
[[ -f $HOME/.ps1 ]] && . $HOME/.ps1
[[ -d $HOME/.local/ ]] && export PATH=$PATH:$HOME/.local/bin/
[[ -f $HOME/.bash_alias ]] && . $HOME/.bash_alias

function extract(){
  case $1 in
    *.rar)
      unrar x -yv $1;;
    *.zip)
      unzip $1;;
    *.tar)
      tar xvf $1;;
    *.tar.gz)
      tar zxvf $1;;
    *.gz)
      gunzip $1;;
  esac
}

# Eternal bash history.
# https://stackoverflow.com/questions/9457233/unlimited-bash-history
export HISTFILESIZE=
export HISTSIZE=

# Steam problems
# export LD_PRELOAD='/usr/$LIB/libstdc++.so.6'
# PATH=$PATH:$HOME/.local/bin
