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


function backdir() {
  a=0
  while [[ \$a -eq 0 ]]; do
    popd &> /dev/null
    a=\$?
  done
  unset a
}

function searchdir() {
  if [[ \$(pwd) == / ]]; then
    backdir
    unset dir
  elif [ -f ./.env/bin/activate ]; then
    dir=\$(pwd)
    backdir
  else
    pushd .. 1> /dev/null
    searchdir
  fi
}

function check_env(){
  if [ -z "\$dir" ]; then
    searchdir
  fi
  if [ -n "\$dir" ]; then
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

cat > $HOME/.vimrc << EOF
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

" Show indent column
Plugin 'nathanaelkane/vim-indent-guides'

" Complete bar in explore
Plugin 'ctrlpvim/ctrlp.vim'

" Pretty bar
" Plugin 'vim-airline/vim-airline'
Plugin 'itchyny/lightline.vim'

" Git functions
Plugin 'tpope/vim-fugitive'

call vundle#end()            " required
filetype plugin indent on    " required


syntax on

set encoding=utf-8
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

set list
set listchars=tab:→→,trail:·
set textwidth=80
set number
set colorcolumn=80
highlight ColorColumn ctermbg=gray
set cursorline
set laststatus=2



nmap <left> :vert res+1<cr>
nmap <right> :vert res-1<cr>
nmap <up> :res+1<cr>
nmap <down> :res-1<cr>
nmap <c-w>wk :Sexplore<cr>
nmap <c-w>wh :Vexplore<cr>
nmap <F2> :IndentGuidesToggle<cr>

let g:netrw_liststyle=3
let g:netrw_sizestyle="H"
let g:netrw_list_hide='^\..*'

" Plugin custom indent-guides
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_guide_size = 1
let g:indent_guides_auto_colors = 0

hi Normal guibg=NONE ctermbg=NONE
hi IndentGuidesOdd  guibg=red   ctermbg=darkgrey
hi IndentGuidesEven guibg=green ctermbg=darkgrey

" Plugin CtrlP
let g:ctrlp_custom_ignore = '\.git$'

" Plugin Lightline
let g:lightline = {
  \ 'colorscheme': 'wombat',
  \ 'active': {
  \   'left': [ [ 'mode', 'paste' ],
  \             [ 'path' ],
  \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ],
  \   'right': [ ['time'], 
  \              ['percent'],
  \              ['lineinfo'] ],
  \ },
  \ 'component_function': {
  \   'gitbranch': 'fugitive#head',
  \   'path': 'LightlinePath',
  \ },
  \ 'component': {
  \   'time': '%{strftime("%H:%M")}',
  \ },
\ }

function! LightlineTime()
  return strftime("%H:%M")
endfunction
function! LightlinePath()
  return expand("%:p:~:h") != '~' ? expand("%:p:~:h") : '~/'
endfunction
EOF

git clone https://github.com/VundleVim/Vundle.vim.git $HOME/.vim/bundle/Vundle.vim
