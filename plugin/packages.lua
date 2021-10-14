return require('packer').startup(function(use)
  use 'Julian/vim-textobj-variable-segment'
  use 'Konstruktionist/vim-fish'
  use 'NoahTheDuke/vim-just'
  use 'bps/vim-textobj-python'
  use 'cespare/vim-toml'
  use 'ddrscott/vim-window'
  use 'enricobacis/vim-airline-clock'
  use 'haya14busa/is.vim'
  use 'hrsh7th/nvim-compe'
  use 'jvirtanen/vim-octave'
  use 'kabouzeid/nvim-lspinstall'
  use 'kana/vim-textobj-entire'
  use 'kana/vim-textobj-indent'
  use 'kana/vim-textobj-syntax'
  use 'kana/vim-textobj-user'
  use 'lambdalisue/gina.vim'
  use 'lluchs/vim-wren'
  use 'm-pilia/vim-pkgbuild'
  use 'machakann/vim-sandwich'
  use 'mhinz/vim-startify'
  use 'neovim/nvim-lspconfig'
  use 'somini/vim-textobj-fold'
  use 'svermeulen/vim-subversive'
  use 'tpope/vim-capslock'
  use 'vim-airline/vim-airline'
  use 'vim-airline/vim-airline-themes'
  use 'wellle/targets.vim'
  use { 'MageJohn/base16-vim', opt = true }
  use { 'arithran/vim-delete-hidden-buffers', cmd = 'DeleteHiddenBuffers' }
  use { 'edluffy/specs.nvim', }
  use {
    'haya14busa/vim-asterisk',
    config = function() vim.g["asterisk#keeppos"] = true end
  }
  use {
    'iamcco/markdown-preview.nvim',
    ft = {'markdown', 'pandoc.markdown', 'rmd'},
    run = ':call mkdp#util#install()'
  }
  use {
    'kassio/neoterm',
    cmd = {'T', 'Tnew' },
    config = function() vim.g.neoterm_default_mod = 'botright' end
  }
  use { 'mhartington/oceanic-next', opt = true }
  use { 'mhinz/vim-signify', event = { 'BufNewFile', 'BufRead' } }
  use { 'moll/vim-bbye', cmd = { 'Bdelete', 'Bwipeout'} }
  use {
    'nvim-telescope/telescope.nvim',
    requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}
  }
  use { 'tpope/vim-abolish', cmd = {'Abolish', 'Subvert', 'S'} }
  use { 'tpope/vim-scriptease', cmd = {'Messages', 'Vopen'} }
  use { 'tpope/vim-vinegar', keys = '-', ft = 'netrw' }
  use {
    'windwp/nvim-autopairs',
    config = function()
      require("nvim-autopairs").setup { enable_check_bracket_line = true }
    end
  }
  use {'mbbill/undotree', cmd = "UndotreeToggle"}
end)
