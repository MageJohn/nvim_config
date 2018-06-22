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
Plug 'mbbill/undotree', {'on': 'UndotreeToggle'}
Plug 'terryma/vim-multiple-cursors'
Plug 'dhruvasagar/vim-table-mode'
Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'neomake/neomake'
Plug 'machakann/vim-sandwich'
Plug 'Shougo/denite.nvim', {'do': ':UpdateRemotePlugins' }
Plug 'tpope/vim-capslock'
Plug 'mhinz/vim-startify'
Plug 'othree/html5.vim'

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
let g:airline#extensions#whitespace#enabled = 0
set noshowmode

" vim-pandoc settings
let g:pandoc#modules#disabled = ["folding"]
let g:pandoc#syntax#conceal#use = 0

" Neomake settings
let g:neomake_python_enabled_makers = ['flake8']
let g:neomake_pandoc_enabled_makers = ['college']
augroup initvim_neomake
    autocmd!
    autocmd FileType python call neomake#configure#automake('nw', 750)
    autocmd FileType pandoc call neomake#configure#automake('w')
    autocmd User NeomakeFinished nested echom 'Neomake finished'
augroup END

" vim-sandwich settings
let g:textobj_sandwich_no_default_key_mappings = 1 " redefined in Maps


"
" Colorscheme settings
" ?color
"

function! s:base16_customize() abort
    call Base16hi("NonText", g:base16_gui01, "", g:base16_cterm01, "", "", "")
    call Base16hi("Whitespace", g:base16_gui01, "", g:base16_cterm01, "", "", "")
    "hi Normal ctermbg=NONE
endfunction

augroup on_change_colorschema
    autocmd!
    autocmd ColorScheme * call s:base16_customize()
augroup END

let base16colorspace = 256
colorscheme base16-phd


"
" Maps
" ?maps
"

let mapleader  = ";"

" Stop the highlighting from the last search
nnoremap <Leader>h :noh<CR>

" Start editing my vi config in a new buffer
nnoremap <Leader>ec :e $MYVIMRC<CR>

" Save and source the current file (for editing a vi config)
nnoremap <Leader>ws :w <bar> so %<CR>

" Open the undo tree
nnoremap <Leader>u :UndotreeToggle<CR>

" Open the location list
nnoremap <Leader>l :lopen<CR>

" Map Ctrl-^ to something more accesible
nnoremap <Leader><Tab> <C-^>

" Insert a literal tab in insert mode
inoremap <S-Tab> <C-V><Tab>

" Move up and down screen lines instead of buffer lines
nnoremap k gk
nnoremap j gj

" Denite maps
nnoremap <Leader>dc :Denite colorscheme<CR>
nnoremap <Leader>db :Denite buffer<CR>
nnoremap <Leader>dd :Denite directory_rec<CR>
nnoremap <Leader>df :Denite file_rec <CR>

" vim-sandwich mapping
xmap ib <Plug>(textobj-sandwich-auto-i)
omap ib <Plug>(textobj-sandwich-auto-i)
xmap ab <Plug>(textobj-sandwich-auto-a)
omap ab <Plug>(textobj-sandwich-auto-a)

xmap iq <Plug>(textobj-sandwich-query-i)
omap iq <Plug>(textobj-sandwich-query-i)
xmap aq <Plug>(textobj-sandwich-query-a)
omap aq <Plug>(textobj-sandwich-query-a)

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
" Custom commands
"
command! ClearLocList lexpr []


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

" vim-sandwich recipes
let g:sandwich#recipes = deepcopy(g:sandwich#default_recipes)
let g:sandwich#recipes += [
\   {
\       'buns': ['(', ')'],
\       'cursor': 'head',
\       'command': ['startinsert'],
\       'kind': ['add', 'replace'],
\       'action': ['add'],
\       'input': ['f']
\   },
\   {
\       'buns': ['*', '*']
\   },
\   {
\       'buns': ['$', '$']
\   },
\   {
\       'buns': ['"""', '"""'],
\       'input': ['m'],
\       'filetype': ['python']
\   }
\]

" Neomake makers
let g:neomake_pandoc_college_maker = {
\   'exe': 'make',
\   'args': ['%:t:r.pdf'],
\   'append_file': 0
\}

"
" Source a machine local config file, which is in the .gitignore
"

runtime init.local.vim
