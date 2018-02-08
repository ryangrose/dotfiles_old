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

" Set defaults for python files
let python_highlight_all=1

au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=79 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix |

" Highlight bad whitespace in python files
" Define BadWhitespace before using in a match
" highlight BadWhitespace ctermbg=red guibg=darkred
" au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

" Set defaults for web files
au BufNewFile,BufRead *.js, *.html, *.css
    \ set tabstop=2 |
    \ set softtabstop=2 |
    \ set shiftwidth=2 |

" Match indents on new lines intelligently
set autoindent
set smartindent

"
"
" Key Bindings
"
"

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

"
" Splits
"

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
set termguicolors

" Colors for tmux
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

" Word wrapping
set wrap
set linebreak
set nolist

" Match indent to file
filetype indent on

" Add shortcut for creating new tabs
nnoremap tn :tabnew<CR>

" 
" Plugins - vim-plug https://github.com/junegunn/vim-plug
"

" Plugins will be downloaded under the specified directory.
call plug#begin('~/.vim/plugged')

" Declare the list of plugins.
Plug 'scrooloose/nerdcommenter'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ctrlpvim/ctrlp.vim'
" Plug 'vim-syntastic/syntastic'
" Plug 'Valloric/YouCompleteMe'

" For Python
Plug 'tmhedberg/SimpylFold', {'for': 'python'}
Plug 'vim-scripts/indentpython.vim', {'for': 'python'}
Plug 'nvie/vim-flake8', {'for': 'python'}

" For html
Plug 'alvan/vim-closetag'
    
"For js
Plug 'pangloss/vim-javascript'
Plug 'hallettj/jslint.vim'

" Colorscheme
Plug 'morhetz/gruvbox'
" Plug 'dylanaraps/wal.vim'

" List ends here. Plugins become visible to Vim after this call.
call plug#end()

"
" Plugin settings
"

" NERD commenter
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Syntastic
" Defaults as recommended by its repo FAQ
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*
" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_check_on_open = 1
" let g:syntastic_check_on_wq = 0

" Ctrl P
" Open new tab instead of replace
let g:ctrlp_prompt_mappings = {
    \ 'AcceptSelection("e")': ['<2-LeftMouse>'],
    \ 'AcceptSelection("t")': ['<cr>'],
    \ }

" SimpylFold
let g:SimpylFold_docstring_preview = 1
let g:SimpylFold_fold_import = 1

" Flake8
" auto run on write
autocmd BufWritePost *.py call Flake8()

" Ignore F821 errors (matches django)
let g:syntastic_python_flake8_args='--ignore=F821'


" Set colorscheme
let g:gruvbox_contrast_dark="hard"
colorscheme gruvbox
set background=dark
" colorscheme wal

" hi! Normal ctermbg=NONE guibg=NONE
" hi! NonText ctermbg=NONE guibg=NONE

" CtrlP - enter creates new tab
let g:ctrlp_prompt_mappings = {
    \ 'AcceptSelection("e")': ['<c-t>'],
    \ 'AcceptSelection("t")': ['<cr>', '<2-LeftMouse>'],
    \ }
