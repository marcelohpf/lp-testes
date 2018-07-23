#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# PS1='[\u@\h \W]\$ '

[ -r /usr/share/bash-completion/bash_completion   ] && . /usr/share/bash-completion/bash_completion

[[ -f $HOME/.bash_alias ]] && . $HOME/.bash_alias
[[ -f $HOME/.bash_utils ]] && . $HOME/.bash_utils
[[ -f $HOME/.pythonrc ]] && export PYTHONSTARTUP="$HOME/.pythonrc"
[[ -d $HOME/.local/bin ]] && export PATH=$PATH:$HOME/.local/bin/

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Eternal bash history.
# https://stackoverflow.com/questions/9457233/unlimited-bash-history
export HISTFILESIZE=
export HISTSIZE=

export PS1="$DEFAULT\w$NONE \$(_env) \$(_git) \n\$ "
