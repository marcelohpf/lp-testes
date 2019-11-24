syntax on

set encoding=utf-8      " Use default encoding UTF-8 for all files
set expandtab           " Transforms tab \t to spaces
set shiftwidth=2        " Size of use >> and <<, ctrl-t and ctrl-d (i) to 2
set softtabstop=2       " Amount of tabs added (i)
set tabstop=2           " Size of tab
set shiftround          " When press tab, set the spaces when press tab to round of shiftwidth multiplier

set smartindent         " Automatic indent for some file types
set foldmethod=indent   " Use fold for indent
set foldlevelstart=2    " Begin with 2 levels of nested folds
set nofoldenable        " Don't fold the content when open a file
set hlsearch            " Highlight the matchs of a search
set ignorecase          " Ignore case when search
" set autochdir           " Automatic switch to directory of current buffer file
set incsearch           " Move screen to matched search
set showmatch           " Show the match bracket {} () []

set list                      " Show control chars
set listchars=tab:\ \>,trail:·  " Change tab and trails chars
"set textwidth=80              " Define max column to text (automatic breakline)
set number                    " Show the numbers of lines
set colorcolumn=80            " Show a red bar in colum 80
set cursorline                " Add a bar in current line of cursor
set cursorcolumn              " Set cursor column

set mouse=n                   " Mouse integration in (n normal, i insert, v visual)

set wildmenu                  " Activate the interactive autocomplete in statusline
set wildmode=longest:full     " Complete with best match and show options in statusline
set laststatus=2              " Always show the status line in windows
"set background=light

colorscheme peachpuff
" The background color for column bar
highlight ColorColumn ctermbg=none ctermfg=4 cterm=none
highlight CursorColumn ctermbg=none ctermfg=none cterm=bold
highlight CursorLine ctermbg=none ctermfg=none cterm=bold

" let g:netrw_liststyle=3             " Configure the Explore as tree
let g:netrw_sizestyle="H"           " Humanable size of files
let g:netrw_list_hide='^\..\+'      " Hide the hidden files

" ignore some folders using vimgrep
set wildignore+=*/vendor/**

" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/..local/share/nvim/plugged')

" Language Server Client
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Syntastic the syntax integration for everything
Plug 'vim-syntastic/syntastic'

" Golang
"Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }


" Plug statusbar
Plug 'itchyny/lightline.vim'

" Awsome git plugin
Plug 'tpope/vim-fugitive'

" Fuzzy search
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'

" Vim tabular
Plug 'godlygeek/tabular'

" Vim terraform highlights and utils
Plug 'hashivim/vim-terraform'

" MD preview
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }

" Mustache helm
Plug 'mustache/vim-mustache-handlebars'

" Visual multi
Plug 'mg979/vim-visual-multi'

" Initialize plugin system
call plug#end()

nmap <c-w>wh :Vexplore<CR>
nmap <c-w>wl :Vexplore!<CR>
nmap <c-w>wk :Hexplore!<CR>
nmap <c-w>wj :Hexplore<CR>
nmap <c-w>e :Explore<CR>
nmap <c-w>r :Rexplore<CR>
nmap <c-w>0 :vertical res <bar> res<CR>
nmap <F6> :exec 'read !'.getline('.')<CR>

nmap <space> :nohlsearch<CR>
nmap <c-j> :bprevious<CR>
nmap <c-k> :bnext<CR>
nmap <c-l> :Buffers<CR>

" Plugin Lightline
let g:lightline = {
  \ 'active': {
  \   'left': [ ['mode', 'paste' ],
  \             ['gitbranch'],
  \             ['lineinfo', 'percent'] ],
  \   'right': [ ['time'],
  \              ['readonly', 'modified', ],
  \              [ 'path', 'filename' ] ],
  \ },
  \ 'component_function': {
  \   'gitbranch': 'fugitive#head',
  \   'path': 'LightlinePath',
  \ },
  \ 'component': {
  \   'time': '%{strftime("%H:%M")}',
  \ },
  \ 'component_expand': {
  \ },
  \ 'component_type': {
  \   'linter_warnings': 'warning',
  \   'linter_errors': 'error',
  \ },
\ }

function! LightlineTime()
  return strftime("%H:%M")
endfunction
function! LightlinePath()
  return expand("%:p:~:h") != '~' ? expand("%:p:~:h") : '~/'
endfunction

" CoC
nnoremap <silent> U :call <SID>show_documentation()<CR>
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Fuzzy
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-o': 'split',
  \ 'ctrl-v': 'vsplit' }

noremap <silent><C-p> :Files<CR>
noremap <silent><C-u> :Rg<CR>

" Syntastic
let g:syntastic_go_checkers = ['go', 'gofmt', 'golint']
let g:syntastic_python_checkers = ['flake8']
