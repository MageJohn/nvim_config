function packagedefs#init()
  if !exists("g:loaded_minpac")
    packadd minpac
  endif
  command! -bar -nargs=+ Pac call minpac#add(<args>)

  call minpac#init()

  " The package manager
  Pac 'k-takata/minpac', {'type': 'opt'}

  " Code intelligence
  "   -> Language server protocl
  Pac 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }
  "   -> Completion
  Pac 'Shougo/deoplete.nvim' 
  Pac 'ervandew/supertab'
  Pac 'Shougo/echodoc.vim'
  " Appearance
  "                           :colorscheme can find opt plugins
  Pac 'MageJohn/base16-vim', {'type': 'opt'}
  Pac 'vim-airline/vim-airline'
  Pac 'vim-airline/vim-airline-themes'
  Pac 'enricobacis/vim-airline-clock'

  " Textobjects
  Pac 'machakann/vim-sandwich'
  Pac 'wellle/targets.vim'
  Pac 'kana/vim-textobj-user'
  Pac 'kana/vim-textobj-entire'
  Pac 'kana/vim-textobj-line'
  Pac 'somini/vim-textobj-fold'

  Pac 'junegunn/vim-easy-align'
  Pac 'Raimondi/delimitMate'
  Pac 'tpope/vim-capslock'
  Pac 'svermeulen/vim-subversive'
  "   Text/Markdown
  Pac 'dhruvasagar/vim-table-mode'
  "   Python
  Pac 'fisadev/vim-isort'
  " Navigation
  "   Jump multiple motions with a displayed key
  Pac 'easymotion/vim-easymotion'
  "   Search improvements
  Pac 'haya14busa/is.vim' " Keep above cutlass
  Pac 'tpope/vim-abolish'
  "   * motion improvements
  Pac 'haya14busa/vim-asterisk'
  "   Jump to matching groups with %
  Pac 'adelarsq/vim-matchit'
  Pac 'tpope/vim-unimpaired'
  Pac 'svermeulen/vim-cutlass'
  Pac 'svermeulen/vim-yoink'
  "   Visualise undos in a tree
  Pac 'mbbill/undotree'
  "   Nice start screen and session management
  Pac 'mhinz/vim-startify'
  "   Close all buffers except one (defaults to current)
  Pac 'vim-scripts/BufOnly.vim'
  Pac 'arithran/vim-delete-hidden-buffers'
  Pac 'moll/vim-bbye'
  "   File manager
  Pac 'scrooloose/nerdtree'
  "   Repeat many plugin operations
  Pac 'tpope/vim-repeat'
  " File types
  Pac 'lluchs/vim-wren'
  Pac 'cespare/vim-toml'

  " VCS integration
  Pac 'mhinz/vim-signify'

  Pac 'tpope/vim-scriptease'

  delcommand Pac
endfunction
