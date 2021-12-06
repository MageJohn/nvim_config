return require("packer").startup(function(use)
  use({ "MageJohn/base16-vim", opt = true })
  use({ "Olical/conjure", config = 'require "pkginit.conjure"' })
  -- configured in init.d/auto-mappings.lua
  use({
    "ms-jpq/coq_nvim",
    branch = "coq",
    requires = {
      { "ms-jpq/coq.artifacts", branch = "artifacts" },
      { "ms-jpq/coq.thirdparty", branch = "3p" },
    },
  })
  use("bakpakin/fennel.vim")
  use("lambdalisue/gina.vim")
  use("haya14busa/is.vim")
  use({
    "iamcco/markdown-preview.nvim",
    ft = { "markdown", "pandoc.markdown", "rmd" },
    run = ":call mkdp#util#install()",
  })
  use({
    "kassio/neoterm",
    cmd = { "T", "Tnew" },
    config = function()
      vim.g.neoterm_default_mod = "botright"
    end,
  })
  -- configured in init.d/auto-mappings.lua
  use({ "windwp/nvim-autopairs" })
  use("williamboman/nvim-lsp-installer")
  use("neovim/nvim-lspconfig")
  use({
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
    config = 'require "pkginit.nvim-treesitter"',
  })
  use({ "mhartington/oceanic-next", opt = true })
  use({ "wellle/targets.vim", config = 'require "pkginit.targets"' })
  use({
    "nvim-telescope/telescope.nvim",
    requires = { { "nvim-lua/popup.nvim" }, { "nvim-lua/plenary.nvim" } },
    config = 'require "pkginit.telescope"',
  })
  use({
    "mbbill/undotree",
    keys = "<Leader>u",
    config = function()
      require("yp.utils").nmap("<Leader>u", "<Cmd>UndotreeToggle<CR>", { noremap = true })
    end,
  })
  use({ "tpope/vim-abolish", cmd = { "Abolish", "Subvert", "S" } })
  use({ "vim-airline/vim-airline", config = 'require "pkginit.vim-airline"' })
  use("enricobacis/vim-airline-clock")
  use("vim-airline/vim-airline-themes")
  use({
    "haya14busa/vim-asterisk",
    config = function()
      vim.g["asterisk#keeppos"] = true
    end,
  })
  use({
    "moll/vim-bbye",
    cmd = { "Bdelete", "Bwipeout" },
    keys = { "<Leader>q", "<Leader>Q" },
    config = function()
      local nmap = require("yp.utils").nmap
      nmap("<Leader>q", "<Cmd>Bwipeout<CR>")
      nmap("<Leader>Q", "<Cmd>bwipeout<CR>")
    end,
  })
  use({
    "tpope/vim-capslock",
    config = function()
      -- Disable the default insert mode mapping from the plugin
      require("yp.utils").imap("<C-L", "<C-L>", { noremap = true })
    end,
  })
  use({ "arithran/vim-delete-hidden-buffers", cmd = "DeleteHiddenBuffers" })
  use("JoanEspasa/vim-eprime")
  use("Konstruktionist/vim-fish")
  use("NoahTheDuke/vim-just")
  use("jvirtanen/vim-octave")
  use("m-pilia/vim-pkgbuild")
  use({
    "vim-pandoc/vim-pandoc",
    setup = 'require "pkginit.vim-pandoc"',
    requires = { "vim-pandoc/vim-pandoc-syntax" }
  })
  use("wlangstroth/vim-racket")
  use({
    "machakann/vim-sandwich",
    config = 'require "pkginit.vim-sandwich"',
    keys = { "sm", "sd", "sdb", "sr", "srb", { "x", "sm" }, { "x", "sd" }, { "x", "sr" } },
  })
  use("tpope/vim-scriptease")
  use({
    "mhinz/vim-signify",
    event = { "BufNewFile", "BufRead" },
    config = function()
      local omap = require("yp.utils").omap
      local xmap = require("yp.utils").xmap
      omap("ic", "<plug>(signify-motion-inner-pending)")
      xmap("ic", "<plug>(signify-motion-inner-visual)")
      omap("ac", "<plug>(signify-motion-outer-pending)")
      xmap("ac", "<plug>(signify-motion-outer-visual)")
    end,
  })
  use({ "mhinz/vim-startify", config = 'require "pkginit.vim-startify"' })
  use({ "svermeulen/vim-subversive", config = 'require "pkginit.vim-subversive"' })
  use("kana/vim-textobj-entire")
  use("somini/vim-textobj-fold")
  use("kana/vim-textobj-indent")
  use("kana/vim-textobj-line")
  use({ "bps/vim-textobj-python", config = 'require "pkginit.vim-textobj-python"' })
  use("kana/vim-textobj-syntax")
  use("kana/vim-textobj-user")
  use("Julian/vim-textobj-variable-segment")
  use("cespare/vim-toml")
  use({ "tpope/vim-vinegar", keys = "-", ft = "netrw" })
  use({
    "ddrscott/vim-window",
    config = 'require "pkginit.vim-window"',
    cmd = { "LayoutH", "LayoutJ", "LayoutK", "LayoutL" },
    keys = {
      "]r",
      "[r",
      "<C-w>r",
      "<C-w><C-r>",
      "<C-w>x",
      "<C-w><c-x>",
      "<C-w>gl",
      "<C-w>gh",
      "<C-w>gj",
      "<C-w>gk",
      "<C-w>gH",
      "<C-w>gJ",
      "<C-w>gK",
      "<C-w>gL",
      "<C-w>o",
      "<C-w><c-o>",
    },
  })
  use("lluchs/vim-wren")
  use("nanotee/zoxide.vim")
end)
