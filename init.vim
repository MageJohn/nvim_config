" >> Vim/Neovim settings >>>

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
  " adding nohls prevents previous searches being highlighted when the
  " config is reloaded
set hlsearch | nohls
set incsearch
set inccommand=nosplit

" Showing whitespace
set listchars=tab:>-,space:.,eol:§,extends:…,precedes:…,nbsp:+

" Indentation settings
set tabstop=4
set shiftwidth=4
set expandtab

" Gutter settings
set number
set relativenumber
set signcolumn=yes

" Enable mouse
set mouse=a

" Cursor stuff
" works in some terminals, so not in ginit.vim
set guicursor=n-v-sm:block,i-c-ci-ve:ver25,r-cr-o:hor20,a:blinkwait1000-blinkoff500-blinkon1000

" Let block select go where there are no characters
set virtualedit=block

" Have ~ work as an operator
set tildeop

" Save the undo history between sessions
set undofile
let &undodir = stdpath("data").."/undo"

" Minimal number of lines to keep above and below the cursor
set scrolloff=4
" Similar for horizontal scrolling
set sidescrolloff=5

" Terminal stuff
"let $TERM = "vte"
if exepath("nvr")
  let $GIT_EDITOR = 'nvr -cc vsplit --remote-wait'
endif

set termguicolors
set title

" Completion
set completeopt=menuone,noselect

" netrw settings
let g:netrw_winsize = 25
let g:netrw_browse_split = 4
let g:netrw_keepdir = 0
let g:netrw_liststyle = 3

" <<<

" >> Autocommands >>>

augroup initvim

"   >> General >>>
  autocmd InsertLeave * pclose
  autocmd TermOpen * setlocal nonumber norelativenumber

  autocmd FileType qf nnoremap <buffer> <esc> <Cmd>cclose<CR>
"   <<<


"   >> FileType settings >>>

"     >> markdown >>>
  autocmd FileType markdown setlocal spell
  autocmd FileType markdown setlocal nolist
  autocmd FileType markdown setlocal textwidth=79
  autocmd FileType markdown setlocal formatoptions+=t
  autocmd FileType markdown setlocal formatoptions+=a
  autocmd FileType markdown setlocal formatoptions-=l
"     <<<

"     >> tex >>>
  autocmd FileType tex setlocal spell
  autocmd FileType tex set formatoptions=cqj
  autocmd FileType tex set textwidth=115
"     <<<

"     >> git >>>
"     When a buffer is opened by a git command using e.g. nvr, close it
"     automatically when it's hidden; this means :q or :wq can be used to
"     close, rather than :bd.
  autocmd FileType gitcommit,gitrebase,gitconfig set bufhidden=delete
"     <<<

"     >> vim, lua >>>
  autocmd FileType vim,lua setlocal tabstop=2 shiftwidth=2 expandtab
"     <<<
"   <<<

"   >> Non-default extensions >>>
  autocmd BufNewFile,BufRead *.xresources set syntax=xdefaults
  autocmd BufNewFile,BufRead *.Xresources set syntax=xdefaults
"   <<<

augroup END
" <<<

" >> Maps >>>

let mapleader = " "

" Open the location list
nnoremap <Leader>lo <Cmd>lopen<CR>
nnoremap <Leader>lc <Cmd>lclose<CR>

" Map Ctrl-^ to something more accesible
nnoremap <Leader><Tab> <C-^>

" Move up and down screen lines instead of buffer lines
nnoremap k gk
nnoremap j gj

" Switch windows with Alt+(h,j,k,l), even in neovim's terminal
tnoremap <A-h> <C-\><C-n><C-w>h
tnoremap <A-j> <C-\><C-n><C-w>j
tnoremap <A-k> <C-\><C-n><C-w>k
tnoremap <A-l> <C-\><C-n><C-w>l
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l

" Convenient escape from the terminal
tnoremap <C-Space> <C-\><C-n>

" Use <Leader>w for window operations
nmap <Leader>w <C-w>

nnoremap <Leader>fs <Cmd>w<CR>

" Use Q to repeat the last macro
nnoremap Q @@

"   >> unimpaired >>>
" Some cherry picked parts of unimpaired
" Note that the plugin is not installed.
nnoremap [l <Cmd>exe "".v:count1."lprevious"<CR>
nnoremap ]l <Cmd>exe "".v:count1."lnext"<CR>
nnoremap [L <Cmd>exe "".v:count1."lfirst"<CR>
nnoremap ]L <Cmd>exe "".v:count1."llast"<CR>

function! s:BlankUp(count) abort
  put!=repeat(nr2char(10), a:count)
  ']+1
  silent! call repeat#set("\<Plug>unimpairedBlankUp", a:count)
endfunction

function! s:BlankDown(count) abort
  put =repeat(nr2char(10), a:count)
  '[-1
  silent! call repeat#set("\<Plug>unimpairedBlankDown", a:count)
endfunction

nnoremap [<Space> <Cmd>call <SID>BlankUp(v:count1)<CR>
nnoremap ]<Space> <Cmd>call <SID>BlankDown(v:count1)<CR>

nnoremap yow <Cmd>set wrap!<CR>
nnoremap yol <Cmd>set list!<CR>

"   <<<

" <<<

" >> Colorscheme settings >>>

colorscheme OceanicNext

" <<<

" >> Custom commands >>>

command! ClearLocList lexpr []
command! ReloadConfig runtime init.vim | runtime ginit.vim

"   >> Zotero helpers >>>
function s:zoterocite()
  " pick a format based on the filetype (customize at will)
  let format = &filetype =~ '.*tex' ? 'citep' : 'pandoc'
  let api_call = 'http://localhost:23119/better-bibtex/cayw?format='.format.'&brackets=1'
  let ref = system('curl -s '.shellescape(api_call))
  return ref
endfunction
command! ZoteroCite call s:zoterocite()

noremap <Leader>z "=ZoteroCite()<CR>p
inoremap <C-z> <C-r>=ZoteroCite()<CR>
"   <<<

" <<<

" >> Source extra files >>>

" Source a machine local config file, which is in the .gitignore
let s:local_init_file = stdpath("config") .. "/init.local.vim"
if filereadable(s:local_init_file)
    execute "source" s:local_init_file
endif

runtime! init.d/*.vim
runtime! init.d/*.lua

" <<<

" vi: foldmethod=marker foldmarker=>>>,<<< foldcolumn=1
