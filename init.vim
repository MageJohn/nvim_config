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

" >> Plugin settings >>>

"   >> vim-airline settings >>>
" Don't show mode (airline does this)
set noshowmode

let g:airline_powerline_fonts = v:true
let g:airline#extensions#tabline#enabled = v:true

let g:airline#extensions#tabline#buffer_idx_mode = 3
nmap [b <Cmd>bnext<CR>
nmap ]b <Cmd>bprev<CR>
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
let g:startify_session_dir = stdpath("data")..'/session'
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

xmap p <plug>(SubversiveSubstitute)
xmap P <plug>(SubversiveSubstitute)

nmap <leader>s <plug>(SubversiveSubstituteRangeNoPrompt)
xmap <leader>s <plug>(SubversiveSubstituteRangeNoPrompt)

let g:subversivePromptWithActualCommand = v:true
nmap <leader>ss <plug>(SubversiveSubstituteWordRange)
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
nmap <Leader>Q <Cmd>bwipeout<CR>
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

"   >> LeaderF >>>
let g:Lf_WindowPosition = 'popup'
let g:Lf_ShortcutF = '<Leader>ff'
nmap <leader>fr <Cmd>LeaderfMru<CR>
nmap <leader>F <Cmd>LeaderfSelf<CR>
nmap <leader>fg <Cmd>LeaderfRgInteractive<CR>
"   <<<

"   >> vim-window >>>
" Unimpaired mapping
nnoremap ]r <Cmd>call window#rotate(-1 * v:count1)<CR>
nnoremap [r <Cmd>call window#rotate(1 * v:count1)<CR>

" Improved window rotate to work with all layouts
nmap <C-w>r ]r
nmap <C-w><C-r> ]r

" Improve window exchange to work with all layouts
nnoremap <C-w>x <Cmd>call window#exchange(v:count)<CR>
nnoremap <C-w><c-x> <Cmd>call window#exchange(v:count)<CR>

" [g]lue windows together.
"    l = glue to right side
"    h = glue to left side
"    j = glue to bottom
"    k = glue to top
"
" `normal! 100zh` scrolls window contents into view since it gets messy when
" narrower window tries refocuses its cursor.
nnoremap <C-w>gl <Cmd>call window#join('rightbelow vsplit', v:count) <BAR>normal! 100zh<CR>
nnoremap <C-w>gh <Cmd>call window#join('leftabove vsplit', v:count)  <BAR>normal! 100zh<CR>
nnoremap <C-w>gj <Cmd>call window#join('belowright split', v:count)  <BAR>normal! 100zh<CR>
nnoremap <C-w>gk <Cmd>call window#join('aboveleft split', v:count)   <BAR>normal! 100zh<CR>

" Force a primary window layout.
" The capital HJKL forces the primary window to a specific direction.
command! -nargs=* LayoutH call window#layout('ball', 'H', <args>)
command! -nargs=* LayoutJ call window#layout('vertical ball', 'J', <args>) 
command! -nargs=* LayoutK call window#layout('vertical ball', 'K', <args>) 
command! -nargs=* LayoutL call window#layout('ball', 'L', <args>)

" Map the layout commands to something if that's your style.
nnoremap <C-w>gH <Cmd>LayoutH v:count<CR>
nnoremap <C-w>gJ <Cmd>LayoutJ v:count<CR>
nnoremap <C-w>gK <Cmd>LayoutK v:count<CR>
nnoremap <C-w>gL <Cmd>LayoutL v:count<CR>

" Improve window only, to split to new tab instead
nnoremap <C-w>o <Cmd>call window#only()<CR>
nnoremap <C-w><c-o> <Cmd>call window#only()<CR>
"   <<<

"   >> pear-tree >>>
" Disable 'dot repeatable expand' because it messes up too often.
let g:pear_tree_repeatable_expand = v:false
" Try to balance pairs instead of greedily adding/deleting pairs
let g:pear_tree_smart_openers = v:true
let g:pear_tree_smart_closers = v:true
let g:pear_tree_smart_backspace = v:true
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

noremap <leader>z "=ZoteroCite()<CR>p
inoremap <C-z> <C-r>=ZoteroCite()<CR>
"   <<<

" <<<

" >> Source extra files >>>

" Source a machine local config file, which is in the .gitignore
let s:local_init_file = stdpath("config") .. "/init.local.vim"
if filereadable(s:local_init_file)
    execute "source" s:local_init_file
endif

" <<<

" vi: foldmethod=marker foldmarker=>>>,<<< foldcolumn=1
