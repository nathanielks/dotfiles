" Vundle and bundle configuration
source ~/.vundlerc

set encoding=utf-8

" Colors
set t_Co=256
set background=dark
color lithium_dark

" Basic
let mapleader = ","
let gmapleader = ","

" Make searches case-sensitive only if they contain upper-case characters
set ignorecase
set smartcase

set gdefault

set incsearch
set hlsearch

" Keep more context when scrolling off the end of a buffer
set scrolloff=3
set title
set numberwidth=5
set autoindent
set smartindent

set showmode
set showcmd

" Allow backgrounding buffers without writing them, and remember marks/undo
" for backgrounded buffers
set hidden

" Make tab completion for files/buffers act like bash
set wildmenu
set wildmode=list:longest
set wildignore=*.swp,tmp,.git,*.png,*.jpg,*.gif,node_modules

set ttyfast
set ruler
set laststatus=2
set modelines=0
set backspace=indent,eol,start
set history=1000
set visualbell " no bell please
set noerrorbells " shut up
set nowrap
set number
set cmdheight=2 " Set the command height to 2 lines
set showmatch " Highlight closing ), >, }, ], etc...
set undolevels=1000
set directory=/tmp
set nowrap
set textwidth=79
set formatoptions=qrn1
set autoread " Make sure that buffers change if the file changed

" Display a place holder character for tabs and trailing spaces
set listchars=tab:▸\ ,eol:¬

" Shortcut to rapidly toggle `set list`
nmap <leader>l :set list!<CR>
" Set line numbers to relative
nmap <leader>r :set relativenumber<cr>
" Toggle cursorline
nmap <leader>c :set cursorline!<cr>
" Open files with <leader>f
map <leader>f :CommandTFlush<cr>\|:CommandT<cr>
" Rails specific CommandT mappings
map <leader>ga :CommandTFlush<cr>\|:CommandT app/assets<cr>
map <leader>gv :CommandTFlush<cr>\|:CommandT app/views<cr>
map <leader>gc :CommandTFlush<cr>\|:CommandT app/controllers<cr>
map <leader>gm :CommandTFlush<cr>\|:CommandT app/models<cr>
map <leader>gh :CommandTFlush<cr>\|:CommandT app/helpers<cr>
" Backbone Rails
map <leader>gj :CommandTFlush<cr>\|:CommandT app/assets/javascripts<cr>
" Custom split for routes and Gemfile
map <leader>gr :topleft :split config/routes.rb<cr>
map <leader>gg :topleft 100 :split Gemfile<cr>

command! W :w

map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

set winwidth=84
" We have to have a winheight bigger than we want to set winminheight. But if
" we set winheight to be huge before winminheight, the winminheight set will
" fail.
set winheight=5
set winminheight=5
set winheight=999

inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>
inoremap jj <ESC>
inoremap II <Esc>I
inoremap AA <Esc>A
inoremap OO <Esc>O
nnoremap / /\v
vnoremap / /\v
nnoremap <leader><space> :noh<cr>
nnoremap <tab> %
vnoremap <tab> %

" strip all trailing whitespace in the current file
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>
" fold tag
nnoremap <leader>ft Vatzf
" open .vimrc file
nnoremap <leader>ev <C-w><C-v><C-l>:e $MYVIMRC<cr>
" Fix those pesky situations where you edit & need sudo to save
cmap w!! w !sudo tee % >/dev/null

autocmd FocusLost * :wa
autocmd FileType php setlocal ts=4 sts=4 sw=4 noexpandtab
autocmd FileType python setlocal ts=4 sts=4 sw=4 expandtab
autocmd FileType javascript,html,css setlocal ts=4 sts=4 sw=4 expandtab
autocmd FileType ruby,pml,erb,haml setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType markdown setlocal wrap linebreak nolist
autocmd BufNewFile,BufRead *.rss setfiletype xml
autocmd BufNewFile,BufRead *.scss setfiletype css.scss
autocmd WinEnter * setlocal cursorline
autocmd WinLeave * setlocal nocursorline
autocmd BufWritePost .vimrc source %

if has("autocmd")
  " Enable filetype detection
  filetype plugin indent on
  " Restore cursor position
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif
endif

if &t_Co > 2 || has("gui_running")
  " Enable syntax highlighting
  syntax on
endif

" Surround Plugin config
let g:surround_{char2nr('-')} = "<% \r %>"
let g:surround_{char2nr('=')} = "<%= \r %>"
let g:surround_{char2nr('8')} = "/* \r */"
let g:surround_{char2nr('s')} = " \r "
let g:surround_{char2nr('^')} = "/^\r$/"
let g:surround_indent = 1

function! ShowColors()
  let num = 255
  while num >= 0
    exec 'hi col_'.num.' ctermbg='.num.' ctermfg=white'
    exec 'syn match col_'.num.' "ctermbg='.num.':...." containedIn=ALL'
    call append(0, 'ctermbg='.num.':....')
    let num = num - 1
  endwhile
endfunction

" Show syntax highlighting groups for word under cursor
nmap <C-S-P> :call <SID>SynStack()<CR>
function! <SID>SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc
