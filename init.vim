"
" Be iMproved
"

if &compatible
  set nocompatible
endif


"
" Plugins (vim-plug)
" ?plug
"

call plug#begin('~/.config/nvim/plugged')

Plug 'chriskempson/base16-vim'
Plug 'Shougo/deoplete.nvim', {'do': ':UpdateRemotePlugins' }
Plug 'zchee/deoplete-jedi'
Plug 'ervandew/supertab'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'mbbill/undotree', {'on': 'UndotreeToggle'}
Plug 'terryma/vim-multiple-cursors'
Plug 'dhruvasagar/vim-table-mode'
Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax'
Plug 'kana/vim-textobj-user'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'neomake/neomake'
Plug 'machakann/vim-sandwich'
Plug 'cloudhead/neovim-fuzzy'
Plug 'Shougo/denite.nvim', {'do': ':UpdateRemotePlugins' }
Plug 'tpope/vim-capslock'

call plug#end()

"
" Built in vim options
" ?sets
" 

let $TERM = "vte"

" Buffers
set hidden

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


" Indentation settings
set tabstop=4
set shiftwidth=4
set expandtab

" Show relative numbers in the gutter, and absolute number at cursor
set number
set relativenumber

" Enable mouse
set mouse=a

" Save the undo history between sessions
set undofile
set undodir=~/.config/nvim/undo/


"
" Plugin settings
" ?lets
"

" Tab completion settings
let g:SuperTabDefaultCompletionType = "<c-n>"
let g:deoplete#enable_at_startup = 1

" vim-airline settings
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
set noshowmode

" vim-pandoc settings
let g:pandoc#modules#disabled = ["folding"]
let g:pandoc#command#latex_engine = "pdflatex"
command! CollegeMDCompile !pandoc %:t ~/Sync/pandoc_metadata.yaml -o %:t:r.pdf --filter pandoc-fignos --filter pandoc-tablenos --filter pandoc-citeproc --template eisvogel

" Neomake settings
let g:neomake_python_enabled_makers = ['flake8']
let g:neomake_pandoc_enabled_makers = ['college']
augroup initvim_neomake
  autocmd!
  autocmd FileType python call neomake#configure#automake('nw', 750)
  autocmd FileType pandoc call neomake#configure#automake('w')
augroup END


"
" Colorscheme settings
" ?color
"

function! s:base16_customize() abort
  call Base16hi("NonText", g:base16_gui01, "", g:base16_cterm01, "", "", "")
  call Base16hi("Whitespace", g:base16_gui01, "", g:base16_cterm01, "", "", "")
  hi Normal ctermbg=NONE
endfunction

augroup on_change_colorschema
  autocmd!
  autocmd ColorScheme * call s:base16_customize()
augroup END

let base16colorspace = 256
colorscheme base16-pop  " also set in ginit.vim


"
" Maps
" ?maps
"

let mapleader  = ";"

" Stop the highlighting from the last search
nnoremap <Leader>h :noh<CR>

" Start editing my vi config in a new tab
nnoremap <Leader>ec :tabe $MYVIMRC<CR>

" Save and source the current file (for editing a vi config)
nnoremap <Leader>ws :w <bar> so %<CR>

" Open the undo tree
nnoremap <Leader>u :UndotreeToggle<CR>

" Open the location list
nnoremap <Leader>l :lopen<CR>

" Move up and down screen lines instead of buffer lines
nnoremap k gk
nnoremap j gj

" Denite maps
nnoremap <Leader>dc :Denite colorscheme<CR>
nnoremap <Leader>db :Denite buffer<CR>
nnoremap <Leader>dd :Denite directory_rec<CR>
nnoremap <Leader>df :Denite file_rec <CR>

" Switch windows with Alt+(h,j,k,l), even in neovim's terminal
tnoremap <A-h> <C-\><C-n><C-w>h
tnoremap <A-j> <C-\><C-n><C-w>j
tnoremap <A-k> <C-\><C-n><C-w>k
tnoremap <A-l> <C-\><C-n><C-w>l
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l

" Unmap the s command. It's pretty useless anyway, and it conflicts with
" vim-sandwich
"nmap s <Nop>
"xmap s <Nop>


"
" Autocommands
" ?autocmd
"
augroup initvim
  autocmd!
  autocmd InsertLeave * pclose
  autocmd FileType markdown setlocal spell
  autocmd FileType markdown setlocal nolist
augroup END


"
" Vim plugin block configs
" ?blocks
"

" vim-textobj-user custom text objects

call textobj#user#plugin('mdemph', {
\   'emph-text': {
\       'pattern': ['\*', '\*'],
\       'select-a': 'aB',
\       'select-i': 'iB',
\   },
\ })

" vim-sandwich recipes
let g:sandwich#recipes = deepcopy(g:sandwich#default_recipes)
let g:sandwich#recipes += [
  \   {
  \     'buns': ['(', ')'],
  \     'cursor': 'head',
  \     'command': ['startinsert'],
  \     'kind': ['add', 'replace'],
  \     'action': ['add'],
  \     'input': ['t']
  \   },
  \ ]

" Neomake makers
let g:neomake_pandoc_college_maker = {
    \ 'exe': 'pandoc',
    \ 'args': ['%:p',
    \          '~/Sync/pandoc_metadata.yaml',
    \          '-o', '%:t:r.pdf',
    \          '--filter', 'pandoc-fignos',
    \          '--filter', 'pandoc-tablenos',
    \          '--filter', 'pandoc-citeproc',
    \          '--template', 'eisvogel'
    \         ]
    \ }

"
" Source a machine local config file, which is in the .gitignore
"

runtime init.local.vim
