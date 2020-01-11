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
set inccommand="nosplit"

" Showing whitespace
set lcs=tab:>-,space:.,eol:§,extends:…,precedes:…,nbsp:+

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

" Let block select go where there are no characters
set virtualedit=block

" Have ~ work as an operator
set tildeop

" Save the undo history between sessions
set undofile
let &undodir = stdpath("data").."/undo"

let g:python3_host_prog = "/usr/bin/python3.8"

" Terminal stuff
"let $TERM = "vte"
if has('nvim')
    let $GIT_EDITOR = 'nvr -cc vsplit --remote-wait'
endif

set termguicolors
set title

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
  autocmd TermOpen * setlocal nonu nornu
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
  autocmd FileType tex set fo=cqj
  autocmd FileType tex set tw=115
"     <<<

"     >> git >>>
"     When a buffer is opened by a git command using e.g. nvr, close it
"     automatically when it's hidden; this means :q or :wq can be used to
"     close, rather than :bd.
  autocmd FileType gitcommit,gitrebase,gitconfig set bufhidden=delete
"     <<<

"     >> vim >>>
" <Tab> indents two spaces, but an actual tab is 8 (for identification)
  autocmd FileType vim setlocal tabstop=8 shiftwidth=2 expandtab
"     <<<

"     >> pyton >>>

"     <<<
"   <<<

"   >> Non-default extensions >>>
  autocmd BufNewFile,BufRead *.xresources set syntax=xdefaults
  autocmd BufNewFile,BufRead *.Xresources set syntax=xdefaults
"   <<<

augroup END
" <<<

" >> Maps >>>

let g:mapleader  = ";"

" Break the undo chain on <CR>
" Makes each line added in insert mode a seperate undo operation
inoremap <CR> <C-g>u<CR>

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

"   >> unimpaired >>>
" Some cherry picked parts of unimpaired
" Note that the plugin is not installed.
nnoremap <silent> [l <Cmd>exe "".v:count1."lprevious"<CR>
nnoremap <silent> ]l <Cmd>exe "".v:count1."lnext"<CR>
nnoremap <silent> [L <Cmd>exe "".v:count1."lfirst"<CR>
nnoremap <silent> ]L <Cmd>exe "".v:count1."llast"<CR>

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

nnoremap <silent> [<Space> <Cmd>call <SID>BlankUp(v:count1)<CR>
nnoremap <silent> ]<Space> <Cmd>call <SID>BlankDown(v:count1)<CR>

nnoremap <silent> yow <Cmd>set wrap!<CR>
nnoremap <silent> yol <Cmd>set list!<CR>

"   <<<

" <<<

" >> Plugin settings >>>

"   >> deoplete settings >>>
let g:deoplete#enable_at_startup = v:true
inoremap <expr><silent> <Tab> pumvisible() ? '<C-n>' : '<Tab>'
inoremap <expr><silent> <S-Tab> pumvisible() ? '<C-p>' : ""
inoremap <expr><silent> <C-l> deoplete#complete_common_string()
packadd! deoplete.nvim
call deoplete#custom#var('file', 'force_completion_length', 4)
"   <<<

"   >> vim-airline settings >>>
" Don't show mode (airline does this)
set noshowmode

let g:airline_powerline_fonts = v:true
let g:airline#extensions#tabline#enabled = v:true

let g:airline#extensions#tabline#buffer_idx_mode = 3
nmap [b <Plug>AirlineSelectPrevTab
nmap ]b <Plug>AirlineSelectNextTab
nmap <expr> gb printf("<Plug>AirlineSelectTab%02d", v:count1)

"   <<<

"   >> "Neomake settings >>>
"let g:neomake_python_enabled_makers = ['flake8']
"let g:neomake_pandoc_enabled_makers = ['md']
"let g:neomake_tex_enabled_makers = ['chktex', 'make']
"let g:neomake_rust_enabled_makers = ['cargo']
"
"augroup initvim_neomake
"  autocmd!
"  autocmd FileType python,rust call neomake#configure#automake('nw', 750)
"  autocmd FileType pandoc call neomake#configure#automake('w')
"  autocmd FileType tex call neomake#configure#automake('w')
"  autocmd User NeomakeFinished echom 'Neomake finished'
"augroup END
"
""   >> Neomake custom makers >>>
"let g:neomake_pandoc_md_maker = {
"\   'exe': 'make',
"\   'args': ['%:t:r.pdf'],
"\   'append_file': 0
"\}
"let g:neomake_tex_xelatex_maker = {
"\   'exe': 'xelatex',
"\   'args': ['-shell-escape', '-file-line-error', '-interaction', 'nonstopmode'],
"\   'errorformat': '%E%f:%l: %m'
"\}
"let g:neomake_tex_make_maker = {
"      \'args': ['%:t:r.pdf'],
"      \'append_file': 0,
"      \'errorformat': '%E%f:%l: %m'
"\}
"
"let g:neomake_python_pyrun_maker = {
"    \ 'exe': 'python',
"    \ 'errorformat': '%E%f:%l:%c: %m',
"    \ 'serialize': 1,
"    \ 'serialize_abort_on_error': 1,
"    \ 'output_stream': 'stdout',
"    \ }
"
"let g:neomake_python_mypy_args = [
"      \ '--hide-error-context',
"      \ '--show-column-numbers',
"      \ '--show-error-code',
"      \ '--no-pretty',
"      \ '--no-color-output',
"      \ '--no-error-summary',
"      \ '--hide-absolute-path',
"      \ '--disallow-incomplete-defs',
"      \ '--namespace-packages',
"      \]
"let g:neomake_python_mypy2_maker = deepcopy(neomake#makers#ft#python#mypy())
"let g:neomake_python_mypy2_maker.exe = 'mypy'
"let g:neomake_python_mypy2_maker.args = g:neomake_python_mypy_args + ['--py2']
""   <<<

"   <<<

"   >> Startify settings >>>
let g:startify_session_persistence = v:true
let g:startify_session_dir = '~/.local/share/nvim/session'
let g:startify_custom_header = [
  \ '   /\   |\                           _            ',
  \ '  /  \  | \                         (_)           ',
  \ ' | \  \ |  |   _ __   ___  _____   ___ _ __ ___   ',
  \ ' |  \  \|  |  | ''_  \/ _ \/ _ \ \ / / | ''_  `_  \ ',
  \ ' |  |\  \  |  | | | |  __/ (_) \ V /| | | | | | | ',
  \ ' |  | \  \ |  |_| |_|\___|\___/ \_/ |_|_| |_| |_| ',
  \ '  \ |  \  /                                       ',
  \ '   \|   \/                                        ',
  \ ]
"   <<<

"   >> asterisk.vim settings >>>
let g:asterisk#keeppos = v:true
"   <<<

"   >> delimitMate settings >>>
let g:delimitMate_expand_cr = 2
let g:delimitMate_expand_space = v:true
let g:delimitMate_jump_expansion = v:true
let g:delimitMate_balance_matchpairs = v:true
let g:delimitMate_excluded_regions = "Comment"
let g:delimitMate_insert_eol_marker = 0  " values: 0, 1, 2
augroup initvim_delimitMate
  au!
  au FileType c let g:delimitMate_insert_eol_marker = 2
  au FileType c let b:delimitMate_eol_marker = ";"
  au FileType python let b:delimitMate_nesting_quotes = ['"', "'"]

  " If one of these characters appears to the left of the cursor then
  " autoclose quotes: = : ( { [ , . \
  au FileType vim let b:delimitMate_smart_quotes = '!\%(=\|:\|(\|{\|[\|,\|\.\|\\\)\s*\%#'
augroup END
"   <<<

"   >> undotree settings >>>
" Open the undo tree
nnoremap <Leader>u <Cmd>UndotreeToggle<CR>
"   <<<

"   >> EasyAlign settings >>>
"   Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
"   Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

"   <<<

"   >> is.vim and asterisk maps >>>
map *  <Plug>(asterisk-z*)<Plug>(is-nohl-1)
map #  <Plug>(asterisk-z#)<Plug>(is-nohl-1)
map g* <Plug>(asterisk-zg*)<Plug>(is-nohl-1)
map g# <Plug>(asterisk-zg#)<Plug>(is-nohl-1)

"   <<<

"   >> fzf settings >>>
if has('nvim') && !exists('g:fzf_layout')
augroup initvim_fzf
  autocmd  FileType fzf set laststatus=0 noshowmode noruler
  \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler
endif
"   <<<

"   >> LanguageClient settings >>>
let g:LanguageClient_serverCommands = {
  \ 'python': ['/usr/local/bin/pyls']
  \ }

let g:LanguageClient_changeThrottle = 0.5
let g:LanguageClient_diagnosticsList = "Location"

function LC_maps()
  if has_key(g:LanguageClient_serverCommands, &filetype)
  nnoremap <silent> gd <Cmd>call LanguageClient#textDocument_definition()<CR>
  nnoremap <silent> H <Cmd>call LanguageClient#textDocument_hover()<CR>
  set formatexpr=LanguageClient#textDocument_rangeFormatting_sync()
  endif
endfunction

autocmd FileType python call LC_maps()

"   <<<

"   >> echodoc settings >>>
let g:echodoc#enable_at_startup = v:true
let g:echodoc#type = "echo"
"   <<<


"   >> Cutlass >>>
"   To cut text with Cutlass we need these mappings
nnoremap x d
xnoremap x d

nnoremap xx dd
nnoremap X D
" With more control over what goes into the clipboard, now we can use the
" system clipboard by default.
set clipboard=unnamedplus
"   <<<

"   >>  Yoink >>>
let g:yoinkSyncNumberedRegisters = v:true
let g:yoinkIncludeDeleteOperations = v:true
let g:yoinkSavePersistently = v:true
let g:yoinkMoveCursorToEndOfPaste = v:true
let g:yoinkSwapClampAtEnds = v:false

nmap <M-]> <plug>(YoinkPostPasteSwapBack)
nmap <M-[> <plug>(YoinkPostPasteSwapForward)

nmap [y <plug>(YoinkRotateBack)
nmap ]y <plug>(YoinkRotateForward)

nmap p <plug>(YoinkPaste_p)
nmap P <plug>(YoinkPaste_P)
"   <<<

"   >> Subversive >>>
nmap s <plug>(SubversiveSubstitute)
nmap ss <plug>(SubversiveSubstituteLine)
nmap S <plug>(SubversiveSubstituteToEndOfLine)

let g:subversivePromptWithActualCommand = v:true

nmap <leader>s <plug>(SubversiveSubvertRange)
xmap <leader>s <plug>(SubversiveSubvertRange)

nmap <leader>S <plug>(SubversiveSubvertWordRange)
"   <<<

"   >> sandwich.vim settings >>>
packadd! vim-sandwich
let g:textobj_sandwich_no_default_key_mappings = v:true
let g:sandwich_no_default_key_mappings = v:true

nmap sm <Plug>(operator-sandwich-add)
xmap sm <Plug>(operator-sandwich-add)

nmap sd <Plug>(operator-sandwich-delete)<Plug>(operator-sandwich-release-count)<Plug>(textobj-sandwich-query-a)
nmap sdb <Plug>(operator-sandwich-delete)<Plug>(operator-sandwich-release-count)<Plug>(textobj-sandwich-auto-a)
nmap sr <Plug>(operator-sandwich-replace)<Plug>(operator-sandwich-release-count)<Plug>(textobj-sandwich-query-a)
nmap srb <Plug>(operator-sandwich-replace)<Plug>(operator-sandwich-release-count)<Plug>(textobj-sandwich-auto-a)
xmap sd <Plug>(operator-sandwich-delete)
xmap sr <Plug>(operator-sandwich-replace)

"   >> Recipes >>>
let g:sandwich#recipes = deepcopy(g:sandwich#default_recipes)
let g:sandwich#recipes += [
\   {
\     'buns': ['(', ')'],
\     'cursor': 'head',
\     'command': ['startinsert'],
\     'kind': ['add', 'replace'],
\     'action': ['add'],
\     'input': ['f']
\   },
\   {
\     'buns': ['*', '*']
\   },
\   {
\     'buns': ['$', '$']
\   },
\   {
\     'buns': ['"""', '"""'],
\     'input': ['m'],
\     'filetype': ['python']
\   }
\]
"   <<<

"   <<<

"   >> textobjects >>>
packadd! vim-textobj-user
"     >> textobj-matchit >>>
let g:textobj_matchit_no_default_key_mappings = v:true

call textobj#user#map('matchit', {
\       '-': {
\              'select-a': 'a%',
\              'select-i': 'i%'
\            }
\ })
"     <<<
"     >> textobj-python >>>
let g:textobj_python_no_default_key_mappings = v:true
augroup initvim_textobj_python
  au!
  au FileType python 
      \ call textobj#user#map('python', {
      \   'class': {
      \     'select-a': '<buffer>aC',
      \     'select-i': '<buffer>iC',
      \     'move-n': '<buffer>]C',
      \     'move-p': '<buffer>[C',
      \   },
      \   'function': {
      \     'select-a': '<buffer>af',
      \     'select-i': '<buffer>if',
      \     'move-n': '<buffer>]f',
      \     'move-p': '<buffer>[f',
      \   }
      \ })
"     <<<
"     >> signify >>>
omap ic <plug>(signify-motion-inner-pending)
xmap ic <plug>(signify-motion-inner-visual)
omap ac <plug>(signify-motion-outer-pending)
xmap ac <plug>(signify-motion-outer-visual)
"     <<<
"   <<<

"   >> bbye >>>
nmap <Leader>q <Cmd>Bwipeout<CR>
"   <<<

"   >> isort >>>
augroup initvim_isort
  au!
  au FileType python packadd vim-isort
augroup END
"   <<<

"   >> table-mode >>>
augroup initvim_tablemode
  au!
  au FileType markdown packadd vim-table-mode
augroup END
"   <<<

"   >> capslock >>>
" Disable the default insert mode mapping from the plugin
inoremap <C-L> <C-L>
"   <<<

"   >> float_preview >>>
let g:float_preview#docked=0
"   <<<
" <<<

" >> Colorscheme settings >>>

colorscheme base16-dracula

" <<<

" >> Custom commands >>>

command! ClearLocList lexpr []
command! ReloadConfig runtime init.vim | runtime ginit.vim

command! -nargs=? Term exe "<mods> split" substitute("+term <args>", " ", '\\ ', "g")
command! -nargs=? VTerm vert Term <args>

"   >> Zotero helpers >>>
function s:zoterocite()
  " pick a format based on the filetype (customize at will)
  let format = &filetype =~ '.*tex' ? 'citep' : 'pandoc'
  let api_call = 'http://localhost:23119/better-bibtex/cayw?format='.format.'&brackets=1'
  let ref = system('curl -s '.shellescape(api_call))
  return ref
endfunction
command! ZoteroCite call s:zoterocite()

noremap <leader>z "=ZoteroCite()<CR>p
inoremap <C-z> <C-r>=ZoteroCite()<CR>
"   <<<

" <<<

" >> Source extra files >>>

" Source ginit.vim if using the gnvim gui
if exists("g:gnvim")
  execute "source" stdpath("config") .. "/ginit.vim"
endif

" Source a machine local config file, which is in the .gitignore
execute "source" stdpath("config") .. "/init.local.vim"

" <<<

" vi: foldmethod=marker foldmarker=>>>,<<< foldcolumn=1
