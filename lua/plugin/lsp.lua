local lspinstall = require'lspinstall'
local lspconfig = require'lspconfig'
local command = require'yp.utils'.command

local on_attach = function(client, bufnr)
  local function nmap(lhs, rhs)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', lhs, string.format(
      "<Cmd>lua %s<CR>", rhs
    ), { noremap=true, silent=true })
  end

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
    'lua vim.lsp.buf.add_workspace_folder(<f-args>)',
    {nargs='?', complete='dir', 'buffer'}
  )
  command(
    'LspWorkspaceRemoveFolder',
    'lua vim.lsp.buf.remove_workspace_folder(<f-args>)',
    {nargs='?', complete='dir', 'buffer'}
  )
  command(
    'LspWorkspaceListFolders',
    'lua print(vim.inspect(vim.lsp.buf.remove_workspace_folder()))',
    {'buffer'}
  )
end

local function setup_servers()
  lspinstall.setup()
  local servers = lspinstall.installed_servers()
  for _, server in pairs(servers) do
    lspconfig[server].setup{ on_attach = on_attach }
  end
end

setup_servers()

-- Automatically reload after `:LspInstall <server>` so we don't have to restart neovim
lspinstall.post_install_hook = function ()
  setup_servers() -- reload installed servers
  vim.cmd("bufdo e") -- this triggers the FileType autocmd that starts the server
end
