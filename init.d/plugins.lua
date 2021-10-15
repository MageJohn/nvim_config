return require('packer').startup(function(use)
  use 'JoanEspasa/vim-eprime'
  use 'Julian/vim-textobj-variable-segment'
  use 'Konstruktionist/vim-fish'
  use 'NoahTheDuke/vim-just'
  use {
    'bps/vim-textobj-python',
    config = 'require "pkginit.vim-textobj-python"'
  }
  use 'cespare/vim-toml'
  use {
    'ddrscott/vim-window',
    config = 'require "pkginit.vim-window"',
    cmd = {"LayoutH", "LayoutJ", "LayoutK", "LayoutL"},
    keys = {
      ']r', '[r', '<C-w>r', '<C-w><C-r>', '<C-w>x', '<C-w><c-x>', '<C-w>gl',
      '<C-w>gh', '<C-w>gj', '<C-w>gk', '<C-w>gH', '<C-w>gJ', '<C-w>gK',
      '<C-w>gL', '<C-w>o', '<C-w><c-o>'
    }
  }
  use 'enricobacis/vim-airline-clock'
  use 'haya14busa/is.vim'
  use {
    'hrsh7th/nvim-compe',
    config = 'require "pkginit.nvim-compe"'
  }
  use 'jvirtanen/vim-octave'
  use 'kabouzeid/nvim-lspinstall'
  use 'kana/vim-textobj-entire'
  use 'kana/vim-textobj-indent'
  use 'kana/vim-textobj-syntax'
  use 'kana/vim-textobj-user'
  use 'lambdalisue/gina.vim'
  use 'lluchs/vim-wren'
  use 'm-pilia/vim-pkgbuild'
  use {
    'machakann/vim-sandwich',
    config = 'require "pkginit.vim-sandwich"',
    keys = {'sm', 'sd', 'sdb', 'sr', 'srb', {'x', 'sm'}, {'x', 'sd'}, {'x', 'sr'}}
  }
  use {
    'mhinz/vim-startify',
    config = 'require "pkginit.vim-startify"'
  }
  use 'neovim/nvim-lspconfig'
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    config = 'require "pkginit.nvim-treesitter"'
  }
  use 'somini/vim-textobj-fold'
  use {
    'svermeulen/vim-subversive',
    config = 'require "pkginit.vim-subversive"'
  }
  use {
    'tpope/vim-capslock',
    config = function()
      -- Disable the default insert mode mapping from the plugin
      require'yp.utils'.imap('<C-L', '<C-L>', {noremap=true})
    end
  }
  use {
    'vim-airline/vim-airline',
    config = 'require "pkginit.vim-airline"'
  }
  use 'vim-airline/vim-airline-themes'
  use {
    'wellle/targets.vim',
    config = 'require "pkginit.targets"'
  }
  use { 'MageJohn/base16-vim', opt = true }
  use { 'arithran/vim-delete-hidden-buffers', cmd = 'DeleteHiddenBuffers' }
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
  use {
    'mhinz/vim-signify',
    event = { 'BufNewFile', 'BufRead' },
    config = function()
      local omap = require"yp.utils".omap
      local xmap = require"yp.utils".xmap
      omap('ic', '<plug>(signify-motion-inner-pending)')
      xmap('ic', '<plug>(signify-motion-inner-visual)')
      omap('ac', '<plug>(signify-motion-outer-pending)')
      xmap('ac', '<plug>(signify-motion-outer-visual)')
    end
  }
  use {
    'moll/vim-bbye',
    cmd = { 'Bdelete', 'Bwipeout'},
    keys = {'<Leader>q', '<Leader>Q'},
    config = function()
      local nmap = require'yp.utils'.nmap
      nmap('<Leader>q', '<Cmd>Bwipeout<CR>')
      nmap('<Leader>Q', '<Cmd>bwipeout<CR>')
    end
  }
  use {
    'nvim-telescope/telescope.nvim',
    requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}},
    config = 'require "pkginit.telescope"'
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
  use {
    'mbbill/undotree',
    keys = "<Leader>u",
    config = function()
      require('yp.utils').nmap('<Leader>u', '<Cmd>UndotreeToggle<CR>', {noremap=true})
    end
  }
end)
