set nocompatible              " be iMproved, required
filetype on                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Plugin Manager
Plugin 'VundleVim/Vundle.vim'

" Show indent column
Plugin 'nathanaelkane/vim-indent-guides'

" Complete bar in explore
Plugin 'ctrlpvim/ctrlp.vim'

" Pretty bar
" Plugin 'vim-airline/vim-airline'
Plugin 'itchyny/lightline.vim'
Plugin 'maximbaz/lightline-ale'

" Tagbar
Plugin 'majutsushi/tagbar'

" Git functions
Plugin 'tpope/vim-fugitive'

" Codestyle lint
" Plugin 'vim-syntastic/syntastic'
Plugin 'w0rp/ale'

" Color preview
Plugin 'ap/vim-css-color'

" Color scheme
Plugin 'Badacadabra/vim-archery'
Plugin 'dim13/smyck.vim'
Plugin 'beigebrucewayne/skull-vim'
Plugin 'davidklsn/vim-sialoquent'
Plugin 'agude/vim-eldar'
Plugin 'acoustichero/goldenrod.vim'
Plugin 'acgissues/contrastneed-theme'
Plugin 'justb3a/vim-smarties'
Plugin 'dim13/xedit.vim'
Plugin 'strange/strange.vim'
Plugin 'broduo/broduo-color-scheme'
Plugin 'zaki/zazen'

" Async grep
Plugin 'ramele/agrep'

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
set foldlevelstart=2
set nofoldenable
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
set laststatus=2
" set background=light
colorscheme goldenrod

noremap <silent> <S-left> :vert res+1<cr>dim13/xedit.vim
noremap <silent> <S-right> :vert res-1<cr>
noremap <silent> <S-up> :res+1<cr>
noremap <silent> <S-down> :res-1<cr>
nmap <silent> <c-w>wk :Hexplore!<cr>
nmap <silent> <c-w>wj :Hexplore<cr>
nmap <silent> <c-w>wh :Vexplore<cr>
nmap <silent> <c-w>wl :Vexplore!<cr>
nmap <silent> <c-w>e :Explore<cr>
nmap <silent> <c-w>r :Rexplore<cr>
nnoremap <C-k> :execute 'silent! tabmove ' . (tabpagenr()-2)<CR>
nnoremap <C-j> :execute 'silent! tabmove ' . (tabpagenr()+1)<CR>
nnoremap <C-h> :tabprevious<CR>
nnoremap <C-l> :tabnext<CR>
" nnoremap <A-k> :cprevious<CR>
" nnoremap <A-j> :cNext<CR>
nmap <F2> :IndentGuidesToggle<cr>
nmap <F3> :ALEToggle<CR>
nmap <F4> :set foldenable!<CR>
nmap <F8> :TagbarToggle<CR>
nmap <C-_> :set ignorecase!<CR>


let g:netrw_liststyle=3
let g:netrw_sizestyle="H"
let g:netrw_list_hide='^\..\+'
let g:netrw_hide=1

" Plugin custom indent-guides
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_guide_size = 1
let g:indent_guides_auto_colors = 0

" highlight Normal guibg=NONE ctermbg=NONE
highlight IndentGuidesOdd  guibg=red   ctermbg=darkgrey
highlight IndentGuidesEven guibg=green ctermbg=darkgrey

" Plugin ALE
let b:ale_linters = ['pylint']

" Plugin CtrlP
let g:ctrlp_custom_ignore = '\v(node_modules|\.git|__pycache__)$'

" Plugin Lightline
let g:lightline = {
  \ 'colorscheme': 'wombat',
  \ 'active': {
  \   'left': [ ['linter_ok', 'linter_warnings', 'linter_errors', 'mode', 'paste' ],
  \             ['gitbranch'],
  \             ['lineinfo', 'percent'] ],
  \   'right': [ ['time'],
  \              ['readonly', 'modified', ],
  \              [ 'path', 'filename' ] ],
  \ },
  \ 'component_function': {
  \   'gitbranch': 'fugitive#head',
  \   'path': 'LightlinePath',
  \   'linter_warnings': 'lightline#ale#warnings',
  \   'linter_errors': 'lightline#ale#errors',
  \   'linter_ok': 'lightline#ale#ok',
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

" function! FindConfig(prefix, what, where)
"     let cfg = findfile(a:what, escape(a:where, ' ') . ';')
"     return cfg !=# '' ? ' ' . a:prefix . ' ' . shellescape(cfg) : ''
" endfunction
" 
" autocmd FileType python let g:ale_python_pylint_options =
"                 \ get(g:, 'ale_python_pylint_options', '') .
"                 \ FindConfig('--rcfile', '.pylintrc', expand('<afile>:p:h', 1))
