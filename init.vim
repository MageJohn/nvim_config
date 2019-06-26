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
Plug 'junegunn/vim-easy-align'
Plug 'lluchs/vim-wren'
Plug 'enricobacis/vim-airline-clock'
Plug 'cespare/vim-toml'
Plug 'easymotion/vim-easymotion'
Plug 'haya14busa/is.vim'
Plug 'python/black'
Plug 'jiangmiao/auto-pairs'

call plug#end()

"
" Built in vim options
" ?sets
" 

let g:python3_host_prog = '/usr/bin/python3.7'

let $TERM = "vte"

" Buffers
set hidden

" Splitting
set splitbelow
set splitright

" Wrapping options
set wrap
set linebreak

" Search settings
set ignorecase
set smartcase
set hlsearch
set incsearch
set inccommand="nosplit"

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

" Don't show mode (airline does this)
set noshowmode


" Autocommands
" -> General
augroup initvim_general
    autocmd!
    autocmd InsertLeave * pclose
augroup END

" -> FileType settings
"    -> markdown
augroup initvim_md
    autocmd!
    autocmd FileType markdown setlocal spell
    autocmd FileType markdown setlocal nolist
    autocmd FileType markdown setlocal textwidth=79
    autocmd FileType markdown setlocal formatoptions+=t
    autocmd FileType markdown setlocal formatoptions+=a
    autocmd FileType markdown setlocal formatoptions-=l
    autocmd FileType pandoc setlocal spell
    autocmd FileType pandoc setlocal nolist
    autocmd FileType pandoc setlocal textwidth=79
    autocmd FileType pandoc setlocal formatoptions+=t
    autocmd FileType pandoc setlocal formatoptions+=a
    autocmd FileType pandoc setlocal formatoptions-=l
augroup END
"    -> tex
augroup initvim_tex
    autocmd!
    autocmd FileType tex setlocal spell
    autocmd FileType tex set fo=cqj
    autocmd FileType tex set tw=115
augroup END

" -> Non-default extensions
augroup initvim_extensions
    autocmd!
    autocmd BufNewFile,BufRead *.xresources set syntax=xdefaults
    autocmd BufNewFile,BufRead *.Xresources set syntax=xdefaults
augroup END



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

" vim-pandoc settings
let g:pandoc#modules#disabled = ["folding"]
let g:pandoc#syntax#conceal#use = 0

" Neomake settings
let g:neomake_python_enabled_makers = ['flake8']
let g:neomake_pandoc_enabled_makers = ['md']
let g:neomake_tex_enabled_makers = ['chktex', 'make']
let g:neomake_rust_enabled_makers = ['cargo']
augroup initvim_neomake
    autocmd!
    autocmd FileType python call neomake#configure#automake('nw', 750)
    autocmd FileType rust call neomake#configure#automake('nw', 750)
    autocmd FileType pandoc call neomake#configure#automake('w')
    autocmd FileType tex call neomake#configure#automake('w')
    autocmd User NeomakeFinished nested echom 'Neomake finished'
augroup END

" vim-sandwich settings
let g:textobj_sandwich_no_default_key_mappings = 1 " redefined in Maps

" Startify settings
let g:startify_session_persistence = 1
let g:startify_session_dir = '~/.local/share/nvim/session'
let g:startify_custom_header = [
    \ '     /\   |\                             _           ',
    \ '    /  \  | \                           (_)          ',
    \ '   | \  \ |  |     _ __   ___  _____   ___ _ __ ___  ',
    \ '   |  \  \|  |    | ''_ \ / _ \/ _ \ \ / / | ''_ ` _ \ ',
    \ '   |  |\  \  |    | | | |  __/ (_) \ V /| | | | | | |',
    \ '   |  | \  \ |    |_| |_|\___|\___/ \_/ |_|_| |_| |_|',
    \ '    \ |  \  /                                        ',
    \ '     \|   \/                                         ',
    \ ]

" Black
let g:black_virtualenv = '/home/yuri/.local/share/nvim/black'


"
" Colorscheme settings
" ?color
"

function! s:base16_customize() abort
    if exists("g:base16_gui01")
        call Base16hi("NonText", g:base16_gui01, "", g:base16_cterm01, "", "", "")
        call Base16hi("Whitespace", g:base16_gui01, "", g:base16_cterm01, "", "", "")
        "hi Normal ctermbg=NONE
    endif
endfunction

augroup on_change_colorscheme
    autocmd!
    autocmd ColorScheme * call s:base16_customize()
augroup END

colorscheme default


"
" Maps
" ?maps
"

let mapleader  = ";"

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

" EasyAlign maps

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

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

" Cite from Zotero
noremap <leader>z "=ZoteroCite()<CR>p
inoremap <C-z> <C-r>=ZoteroCite()<CR>

" Easymotion
map <Leader> <Plug>(easymotion-prefix)

" Unmap the s command. It's pretty useless anyway, and it conflicts with
" vim-sandwich
"nmap s <Nop>
"xmap s <Nop>


"
" Custom commands
"
command! ClearLocList lexpr []

function! ZoteroCite()
  " pick a format based on the filetype (customize at will)
  let format = &filetype =~ '.*tex' ? 'citep' : 'pandoc'
  let api_call = 'http://localhost:23119/better-bibtex/cayw?format='.format.'&brackets=1'
  let ref = system('curl -s '.shellescape(api_call))
  return ref
endfunction

"
" Autocommands
" ?autocmd
"

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
let g:neomake_pandoc_md_maker = {
\   'exe': 'make',
\   'args': ['%:t:r.pdf'],
\   'append_file': 0
\}
let g:neomake_tex_xelatex_maker = {
\   'exe': 'xelatex',
\   'args': ['-shell-escape', '-file-line-error', '-interaction', 'nonstopmode'],
\   'errorformat': '%E%f:%l: %m'
\}
let g:neomake_tex_make_maker = {
            \'args': ['%:t:r.pdf'],
            \'append_file': 0,
            \'errorformat': '%E%f:%l: %m'
\}

let g:neomake_python_pyrun_maker = {
        \ 'exe': 'python',
        \ 'errorformat': '%E%f:%l:%c: %m',
        \ 'serialize': 1,
        \ 'serialize_abort_on_error': 1,
        \ 'output_stream': 'stdout',
        \ }
"
" Source a machine local config file, which is in the .gitignore
"

runtime init.local.vim
