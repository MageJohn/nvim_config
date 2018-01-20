if &compatible
  set nocompatible  " Be iMproved
endif

call plug#begin('~/.config/nvim/plugged')

Plug 'zcodes/vim-colors-basic'
Plug 'vim-scripts/surround.vim'
Plug 'Shougo/deoplete.nvim', {'do': ':UpdateRemotePlugins' }
Plug 'zchee/deoplete-jedi'
Plug 'ervandew/supertab'
Plug 'kien/ctrlp.vim'
Plug 'mbbill/undotree'
Plug 'terryma/vim-multiple-cursors'
Plug 'dhruvasagar/vim-table-mode'
Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax'
Plug 'vim-scripts/repeat.vim'
Plug 'kana/vim-textobj-user'

call plug#end()


let g:SuperTabDefaultCompletionType = "<c-n>"
let g:deoplete#enable_at_startup = 1

let $TERM = "vte"

" Wrapping options
set wrap
set linebreak

" Search settings
set ignorecase
set smartcase
set hlsearch

" Set vim to show whitespace
set lcs=tab:>-,space:.,eol:§
set list

" Markdown settings
autocmd FileType markdown setlocal spell
autocmd FileType markdown setlocal nolist


" Tab settings
set tabstop=4
set shiftwidth=4
set expandtab

" Show relative numbers in the gutter, and absolute number at cursor
set number
set relativenumber

" Enable mouse
set mouse=a

" Set colour scheme and make sure that the terminal BG remains transperant
colorscheme basic-dark
hi Normal ctermbg=NONE


" Save the undo history between sessions
set undofile
set undodir=~/.config/nvim/undo/


"
" Maps
"

"This unsets the "last search pattern" register by hitting return
nnoremap <CR> :noh<CR><CR>

nnoremap k gk
nnoremap j gj
" Switch windows with Alt+(h,j,k,l), even in terminal
tnoremap <A-h> <C-\><C-n><C-w>h
tnoremap <A-j> <C-\><C-n><C-w>j
tnoremap <A-k> <C-\><C-n><C-w>k
tnoremap <A-l> <C-\><C-n><C-w>l
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l

nnoremap <F5> :UndotreeToggle<cr>

function! Cite()
    r!pandoc-cite
endfunction

"
" Autocommands
"
if !exists("initvim_autocmds")
  let initvim_autocmds = 1
  autocmd InsertLeave * pclose
endif

" vim-textobj-user custom text objects

call textobj#user#plugin('mdemph', {
\   'emph-text': {
\       'pattern': ['\*', '\*'],
\       'select-a': 'aB',
\       'select-i': 'iB',
\   },
\ })
