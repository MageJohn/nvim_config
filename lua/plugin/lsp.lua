local lspinstall = require 'lspinstall'
local lspconfig = require 'lspconfig'
local command = require 'yp.utils'.command

local on_attach = function(_, bufnr)
  ---@param mode string one of ''|'!'|'n'|'v'|'x'|'s'|'o'|'i'|'l'|'c'|'t'
  ---@param lhs string the key sequence being mapped
  ---@param rhs string a lua expression that will be triggered by the mapping
  local function map(mode, lhs, rhs)
    vim.api.nvim_buf_set_keymap(bufnr, mode, lhs, string.format(
      "<Cmd>lua %s<CR>", rhs
    ), { noremap=true, silent=true })
  end
  ---@param lhs string the key sequence being mapped
  ---@param rhs string a lua expression that will be triggered by the mapping
  local function nmap(lhs, rhs) map('n', lhs, rhs) end
  ---@param lhs string the key sequence being mapped
  ---@param rhs string a lua expression that will be triggered by the mapping
  local function imap(lhs, rhs) map('i', lhs, rhs) end

  --Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  nmap('gD', 'vim.lsp.buf.declaration()')
  nmap('gd', 'vim.lsp.buf.definition()')
  nmap('<leader>D', 'vim.lsp.buf.type_definition()')
  nmap('gr', 'vim.lsp.buf.references()')
  nmap('gi', 'vim.lsp.buf.implementation()')
  nmap('K', 'vim.lsp.buf.hover()')
  nmap('<C-k>', 'vim.lsp.buf.signature_help()')
  imap('<C-k>', 'vim.lsp.buf.signature_help()')
  nmap('<leader>e', 'vim.lsp.diagnostic.show_line_diagnostics()')
  nmap('[d', 'vim.lsp.diagnostic.goto_prev()')
  nmap(']d', 'vim.lsp.diagnostic.goto_next()')
  nmap('<leader>ld', 'vim.lsp.diagnostic.set_loclist()')
  nmap('<leader>ca', 'vim.lsp.buf.code_action()')
  nmap("<leader>cf", "vim.lsp.buf.formatting()")
  nmap('<leader>cr', 'vim.lsp.buf.rename()')

  -- Commands

  command(
    'LspWorkspaceAddFolder',
    vim.lsp.buf.add_workspace_folder,
    {nargs='?', complete='dir', 'buffer'},
    true
  )
  command(
    'LspWorkspaceRemoveFolder',
    vim.lsp.buf.remove_workspace_folder,
    {nargs='?', complete='dir', 'buffer'},
    true
  )
  command(
    'LspWorkspaceListFolders',
    vim.lsp.buf.list_workspace_folders,
    {'buffer'},
    true
  )
end

local server_configs = {
  lua = {
    settings = {
      Lua = {
        runtime = {
          version = 'LuaJIT',
        },
        diagnostics = {
          globals = { 'vim' }
        },
        workspace = {
          library = {
            [vim.fn.expand('$VIMRUNTIME/lua')] = true,
            [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true,
          },
          useGitignore = false,
          ignoreSubmodules = false,
        },
      }
    }
  },
  arduino = {
    clangd_exe = '/usr/local/Cellar/llvm/12.0.0/bin/clangd'
  }
}

local function setup_servers()
  lspinstall.setup()
  local servers = lspinstall.installed_servers()
  for _, server in pairs(servers) do
    lspconfig[server].setup(
      vim.tbl_deep_extend(
        'error',
        { on_attach = on_attach },
        server_configs[server] or {}
      )
    )
  end
end

require('plugin/lsp-servers/arduino-language-server')

setup_servers()

-- Automatically reload after `:LspInstall <server>` so we don't have to restart neovim
lspinstall.post_install_hook = function ()
  setup_servers() -- reload installed servers
  vim.cmd("bufdo e") -- this triggers the FileType autocmd that starts the server
end
