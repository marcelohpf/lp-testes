set nocompatible              " be iMproved, required
filetype off                  " required


" set the runtime path to include Vundle and initialize
call plug#begin()

" Plugin Manager
" Plugin 'VundleVim/Vundle.vim'

" Git functions
Plug 'tpope/vim-fugitive'

" Show indent column
Plug 'nathanaelkane/vim-indent-guides'

" Complete bar in explore
Plug 'ctrlpvim/ctrlp.vim'

" Elixir syntax highlight
Plug 'elixir-editors/vim-elixir'

" Color preview
" Plugin 'ap/vim-css-color'

" Pretty bar
" Plugin 'vim-airline/vim-airline'
Plug 'itchyny/lightline.vim'
" Plugin 'maximbaz/lightline-ale'

call plug#end()            " required

filetype plugin indent on    " required

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
set autochdir           " Automatic switch to directory of current buffer file
set incsearch           " Move screen to matched search
set showmatch           " Show the match bracket {} () []

set list                      " Show control chars
set listchars=tab:→→,trail:·  " Change tab and trails chars
set textwidth=80              " Define max column to text (automatic breakline)
set number                    " Show the numbers of lines
set colorcolumn=80            " Show a red bar in colum 80
set cursorline                " Add a bar in current line of cursor

set wildmenu                  " Activate the interactive autocomplete in statusline
set wildmode=longest:full     " Complete with best match and show options in statusline
set laststatus=2              " Always show the status line in windows
" set background=light
" The background color for column bar
highlight ColorColumn ctermbg=gray

" Shortcuts keyboards
" Windows
" Increase vertical window size
noremap <silent> <S-left> :vert res+1<cr>
" Decrease vertical window size
noremap <silent> <S-right> :vert res-1<cr>
" Increase horizontal window size
noremap <silent> <S-up> :res+1<cr>
" Decrease horizontal window size
noremap <silent> <S-down> :res-1<cr>
" Open a Netwr tree on top
nmap <silent> <c-w>wk :Hexplore!<cr>
" Open a Netwr tree on bottom
nmap <silent> <c-w>wj :Hexplore<cr>
" Open a Netrw tree on left
nmap <silent> <c-w>wh :Vexplore<cr>
" Open a Netrw tree on right
nmap <silent> <c-w>wl :Vexplore!<cr>
" Open a Netrw tree on current window
nmap <silent> <c-w>e :Explore<cr>
" Go and back from Netrw tree
nmap <silent> <c-w>r :Rexplore<cr>

" Tabs
" Move tab to left
nnoremap <C-k> :execute 'silent! tabmove ' . (tabpagenr()-2)<CR>
" Move tab to rigth
nnoremap <C-j> :execute 'silent! tabmove ' . (tabpagenr()+1)<CR>
" Change to previous tab
nnoremap <C-h> :tabprevious<CR>
" Change to next tab
nnoremap <C-l> :tabnext<CR>

" nnoremap <A-k> :cprevious<CR>
" nnoremap <A-j> :cNext<CR>
"
" Commands toggle
" Toggle left numbers lines
nmap <F3> :set nu!<CR>
" Toggle lines wrapp
nmap <F4> :set wrap!<CR>
" Toggle folds
nmap <F5> :set foldenable!<CR>
" Toggle ignore case
nmap <F6> :set ignorecase!<CR>


let g:netrw_liststyle=3             " Configure the Explore as tree
let g:netrw_sizestyle="H"           " Humanable size of files
let g:netrw_list_hide='^\..\+'      " Hide the hidden files
let g:netrw_hide=1                  " Show only non hidden files

" Plugin custom indent-guides
let g:indent_guides_enable_on_vim_startup = 1   " Enable indent guides
let g:indent_guides_guide_size = 1              " Indent guides bar size
let g:indent_guides_auto_colors = 0             " Don't use random colors

" Set the Indent Guides Colors as darkgrey to not alternate
highlight Normal guibg=NONE ctermbg=NONE
highlight IndentGuidesOdd  guibg=red   ctermbg=darkgrey
highlight IndentGuidesEven guibg=green ctermbg=darkgrey


" Plugin Lightline
let g:lightline = {
  \ 'colorscheme': 'wombat',
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



" Command Shell like :! but output get in another window
command! -complete=shellcmd -nargs=+ Shell call s:RunShellCommand(<q-args>)

" Function that executes the shell command and open another buffer
function! s:RunShellCommand(cmdline)
  " echo a:cmdline
  let expanded_cmdline = a:cmdline
  for part in split(a:cmdline, ' ')
     if part[0] =~ '\v[%#<]'
        let expanded_part = fnameescape(expand(part))
        let expanded_cmdline = substitute(expanded_cmdline, part, expanded_part, '')
     endif
  endfor
  botright new
  setlocal buftype=nofile bufhidden=wipe nobuflisted noswapfile nowrap
  call setline(1, 'Command:  ' .expanded_cmdline)
  call setline(2,substitute(getline(1),'.','=','g'))
  execute '$read !'. expanded_cmdline
  setlocal nomodifiable
  1
endfunction
