#!/bin/bash
NAME="Marcelo Ferreira"
EMAIL="marcelohpf@gmail.com"

yes S | sudo pacman -Sy git curl wget curl tree htop vim terminator yaourt

git config --global user.name $NAME
git config --global user.email $EMAIL
git config --global core.editor vim

cat > $HOME/.bash_alias << EOF
alias gc="git commit"
alias gb="git branch"
alias gr="git reset"
alias gl="git log"
alias gco="git checkout"
alias gs="git status"
alias gd="git diff"
alias ga="git add"
alias py="python3"
EOF

cat > $HOME/.vimrc << EOF
set expandtab
set shiftwidth=2
set softtabstop=2
set tabstop=2

set smartindent
set foldmethod=indent
set hlsearch
set ignorecase
set autochdir
set incsearch
set showmatch

set list
set listchars=tab:→→,trail:·
set textwidth=80
set number
set colorcolumn=80
highlight ColorColumn ctermbg=gray
set cursorline

nmap <left> :vert res+1<cr>
nmap <right> :vert res-1<cr>
nmap <up> :res+1<cr>
nmap <down> :res-1<cr>
nmap <c-w>wk :Sexplore<cr>
nmap <c-w>wh :Vexplore<cr>

let g:netrw_liststyle=3
let g:netrw_sizestyle="H"
let g:netrw_list_hide='^\..*'
EOF

pip3 install virtualenv --user

cat > $HOME/.ps1 << EOF
BLACK='\e[30m'
CYAN='\e[36m'
RED='\e[31m'
GREEN='\e[32m'
YELLOW='\e[33m'
WHITE='\e[37m'
BACKBLACK='\e[40m'
BACKCYAN='\e[46m'
BACKRED='\e[41m'
BACKGREEN='\e[42m'
BACKYELLOW='\e[43m'
BACKWHITE='\e[47m'
NONE='\e[0m'
DEFAULT=\$CYAN

function git_ps1(){
  __git_ps1=\$(git branch 2> /dev/null | awk '/^*/{print \$2}')
  if [[ ! -z \$__git_ps1 ]]; then
    __git_ps1="\$DEFAULT(\$RED\$__git_ps1\$DEFAULT)\$NONE"
  fi
}

function check_env(){
  if [ -f ./.env/bin/activate ]; then
    dir=\$(pwd)
    source \$dir/.env/bin/activate
    export PS1=\$_OLD_VIRTUAL_PS1
    name="venv"
    __venv="\$DEFAULT(\$GREEN\$name\$DEFAULT) \$NONE"
  fi
  case \$(pwd) in
    \$dir/*)
      ;;
    \$dir)
      ;;
    *)
      __venv=""
      deactivate 2> /dev/null
    ;;
  esac
}

function battery(){
  level=\$(cat /sys/class/power_supply/BAT1/capacity)
  status=\$(cat /sys/class/power_supply/BAT1/status)

  if [ \$level -lt 30 ]; then
    color=\$RED
  elif [ \$level -lt 60 ]; then
    color=\$YELLOW
  elif [ \$status = "Charging" ]; then
    color=\$WHITE
  else
    color=\$BLACK
  fi
  if [ \$status != "Charging" ]; then
    __level="\$color\$BACKWHITE\$level\$NONE"
  else
    __level="\$color\$level\$NONE"
  fi
}

function __command_color(){
  echo -e \$__git_ps1 \$__venv \$__level
}

export PROMPT_COMMAND="\$PROMPT_COMMAND;git_ps1;check_env;battery"

export PS1='[\e[36;5m\w \$(__command_color)\e[0m] \n\\$ '
EOF

echo '
[[ -f $HOME/.pythonrc ]] && export PYTHONSTARTUP="$HOME/.pythonrc"
[[ -f $HOME/.ps1 ]] && . $HOME/.ps1
[[ -d $HOME/.local/ ]] && export PATH=$PATH:$HOME/.local/bin/
[[ -f $HOME/.bash_alias ]] && . $HOME/.bash_alias' >> $HOME/.bashrc

curl https://raw.githubusercontent.com/creationix/nvm/master/install.sh | bash

. $HOME/.bashrc
