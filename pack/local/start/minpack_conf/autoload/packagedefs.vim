function! packagedefs#init()
  if !exists("g:loaded_minpac")
    packadd minpac
  endif
  command! -bar -nargs=+ Pac call minpac#add(<args>)

  call minpac#init()

  " -> The package manager
      Pac 'k-takata/minpac', {'type': 'opt'}

  " -> Editing
      Pac 'autozimu/LanguageClient-neovim', {'branch': 'next', 'do': '!bash install.sh'}
  "   -> Completion
        Pac 'Shougo/deoplete.nvim'
        Pac 'ncm2/float-preview.nvim'
        Pac 'tmsvg/pear-tree'
  "   -> Formatting
        Pac 'junegunn/vim-easy-align', {'type': 'opt'}
        Pac 'dhruvasagar/vim-table-mode', {'type': 'opt'}
  "   -> Refactoring
        Pac 'machakann/vim-sandwich'
        Pac 'svermeulen/vim-subversive'
        Pac 'tpope/vim-abolish'
  "   -> Text Objects
        Pac 'wellle/targets.vim'
        Pac 'kana/vim-textobj-user'
        Pac 'kana/vim-textobj-entire'
        Pac 'somini/vim-textobj-fold'
        Pac 'kana/vim-textobj-syntax'
        Pac 'bps/vim-textobj-python'
        Pac 'kana/vim-textobj-indent'
        Pac 'Julian/vim-textobj-variable-segment'
  "   -> Searching
        Pac 'haya14busa/is.vim'
        Pac 'haya14busa/vim-asterisk'
  "   -> Miscellaneous
        Pac 'tpope/vim-capslock'
        Pac 'Yggdroot/LeaderF', {'do': '!./install.sh'}
        Pac 'svermeulen/vim-cutlass'
        Pac 'svermeulen/vim-yoink'
        Pac 'mbbill/undotree'

  " -> Appearance
  "   -> Colorscheme
        Pac 'MageJohn/base16-vim', {'type': 'opt'}
  "   -> Statusline
        Pac 'vim-airline/vim-airline'
        Pac 'vim-airline/vim-airline-themes'
        Pac 'enricobacis/vim-airline-clock'
  "   -> Syntax highlighting
        Pac 'lluchs/vim-wren'
        Pac 'cespare/vim-toml'
        Pac 'jvirtanen/vim-octave'
  "   -> Miscellaneous
        Pac 'mhinz/vim-startify'

  " -> VCS integration
    Pac 'mhinz/vim-signify'
    Pac 'lambdalisue/gina.vim'

  " -> Miscellaneous
    Pac 'arithran/vim-delete-hidden-buffers'
    Pac 'moll/vim-bbye'
    Pac 'tpope/vim-vinegar'
    Pac 'tpope/vim-scriptease'
    Pac 'ddrscott/vim-window'


  " Libraries
    Pac 'tpope/vim-repeat'

  delcommand Pac
endfunction
