" Fix terminal coloring
set t_ut=

"Make search ignore case
set ignorecase

" Allows for realtime regex testing
set incsearch

" Override 'ignorecase' if search contains capitals
set smartcase

" Don't close buffers when you move away from them for a sec...
" Just hide 'em!
set hidden

" Enable syntax highlighting
syntax on

" Relative line numbering on the left-hand side and absolute numbering on the
" current line
set relativenumber
set number

" Expands tabs into spaces for better cross-platform viewing
set expandtab

" No more jerking the page halfway over for text that extends
" beyond the screen width
set sidescroll=1


" Default to 4 space tabs for unknown filetypes
set tabstop=4
set softtabstop=4
set shiftwidth=4

" Match indents on new lines intelligently
set autoindent
set smartindent

" Don't want to press shift to go into command mode
nnoremap ; :
vnoremap ; :

" Reload buffer if file has been externally modified
set autoread

" Stay in place while joining lines
nnoremap J mzJ`z

" Make space the leader key (basically, a key that you can use to add other
" bindings. the idea being that you can change it later to be like... "," or
" something and all of your leader-prefixed mappings still work, just with commas
" now)
let mapleader = "\<Space>"

" Switch to the previous buffer (since space is the leader key, this is
" equivalent to <Space><Tab>)
nnoremap <Leader><Tab> :b#<CR>

" Easier split maneuvering
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Faster splits with leader mappings
nnoremap <Leader>\ :vs<CR>
nnoremap <Leader>- :sp<CR>

" Escape used to be closer to where the caps lock key is now, so instead,
" others and I use "jk" to return to command mode, since it's on home row, and
" those two consecutive keys come up surprisingly infrequently
"
" inoremap jk <ESC>

" Enable 256 colors palette in Gnome Terminal
set t_Co=256

" Word wrapping
set wrap
set linebreak
set nolist

" Match indent to file
filetype indent on


" Plugins - vim-plug https://github.com/junegunn/vim-plug
"
"
" Plugins will be downloaded under the specified directory.
call plug#begin('~/.vim/plugged')

" Declare the list of plugins.
Plug 'morhetz/gruvbox'
Plug 'scrooloose/nerdcommenter'
Plug 'jceb/vim-orgmode'
Plug 'vim-scripts/utl.vim'
Plug 'tpope/vim-speeddating'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
    
" Plug 'dylanaraps/wal.vim'

" List ends here. Plugins become visible to Vim after this call.
call plug#end()

" NERD commenter
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Set colorscheme
colorscheme gruvbox
set background=dark
