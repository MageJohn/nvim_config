return require('packer').startup(function(use)
--> Editing
---> Language Server
  use 'neovim/nvim-lspconfig'
  use 'kabouzeid/nvim-lspinstall'
---> Completion
  use 'ncm2/float-preview.nvim'
  use 'tmsvg/pear-tree'
---> Refactoring
  use 'machakann/vim-sandwich'
  use 'svermeulen/vim-subversive'
  use {
    'tpope/vim-abolish',
    cmd = {'Abolish', 'Subvert', 'S'}
  }
---> Text Objects
  use 'wellle/targets.vim'
  use 'kana/vim-textobj-user'
  use 'kana/vim-textobj-entire'
  use 'somini/vim-textobj-fold'
  use 'kana/vim-textobj-syntax'
  use 'bps/vim-textobj-python'
  use 'kana/vim-textobj-indent'
  use 'Julian/vim-textobj-variable-segment'
---> Searching
  use 'haya14busa/is.vim'
  use 'haya14busa/vim-asterisk'
---> Miscellaneous
  use 'tpope/vim-capslock'
  use { 'Yggdroot/LeaderF', run = './install.sh' }
  use 'svermeulen/vim-cutlass'
  use 'svermeulen/vim-yoink'
  use {'mbbill/undotree', cmd = "UndotreeToggle"}

--> Appearance
---> Colorscheme
  use { 'MageJohn/base16-vim', opt = true }
---> Statusline
  use 'vim-airline/vim-airline'
  use 'vim-airline/vim-airline-themes'
  use 'enricobacis/vim-airline-clock'
---> Syntax highlighting
  use 'lluchs/vim-wren'
  use 'cespare/vim-toml'
  use 'jvirtanen/vim-octave'
---> Miscellaneous

--> VCS integration
  use {
    'mhinz/vim-signify',
    event = { 'BufNewFile', 'BufRead' }
  }
  use 'lambdalisue/gina.vim'

--> Buffer management
  use {
    'arithran/vim-delete-hidden-buffers',
    cmd = 'DeleteHiddenBuffers'
  }
  use {
    'moll/vim-bbye',
    cmd = { 'Bdelete', 'Bwipeout'}
  }

--> Miscellaneous
  use {
    'tpope/vim-vinegar',
    keys = '-',
    ft = 'netrw'
  }
  use {
    'tpope/vim-scriptease',
    cmd = {'Messages', 'Vopen'}
  }
  use 'ddrscott/vim-window'
  use 'mhinz/vim-startify'
  use {
    'kassio/neoterm',
    cmd = {'T', 'Tnew' },
    config = function()
        vim.g.neoterm_default_mod = 'botright'
    end
  }
end)
