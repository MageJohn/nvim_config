local lsp_installer = require("nvim-lsp-installer")

local on_attach = function(_, bufnr)
  local function map(mode, lhs, rhs)
    vim.api.nvim_buf_set_keymap(
      bufnr,
      mode,
      lhs,
      string.format("<Cmd>lua %s<CR>", rhs),
      { noremap = true, silent = true }
    )
  end

  --Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  map("n", "gD", "vim.lsp.buf.declaration()")
  map("n", "gd", "vim.lsp.buf.definition()")
  map("n", "<leader>D", "vim.lsp.buf.type_definition()")
  map("n", "gr", "vim.lsp.buf.references()")
  map("n", "gi", "vim.lsp.buf.implementation()")
  map("n", "K", "vim.lsp.buf.hover()")
  map("n", "<C-k>", "vim.lsp.buf.signature_help()")
  map("i", "<C-k>", "vim.lsp.buf.signature_help()")
  map("n", "<leader>e", "vim.lsp.diagnostic.show_line_diagnostics()")
  map("n", "[d", "vim.lsp.diagnostic.goto_prev()")
  map("n", "]d", "vim.lsp.diagnostic.goto_next()")
  map("n", "<leader>ld", "vim.lsp.diagnostic.set_loclist()")
  map("n", "<leader>ca", "vim.lsp.buf.code_action()")
  map("v", "<leader>ca", "vim.lsp.buf.range_code_action()")
  map("n", "<leader>cf", "vim.lsp.buf.formatting()")
  map("n", "<leader>cr", "vim.lsp.buf.rename()")

  -- Commands

  local command = require("yp.utils").command
  command(
    "LspWorkspaceAddFolder",
    vim.lsp.buf.add_workspace_folder,
    { nargs = "?", complete = "dir", "buffer" },
    true
  )
  command(
    "LspWorkspaceRemoveFolder",
    vim.lsp.buf.remove_workspace_folder,
    { nargs = "?", complete = "dir", "buffer" },
    true
  )
  command("LspWorkspaceListFolders", vim.lsp.buf.list_workspace_folders, { "buffer" }, true)
end

local server_configs = {
  sumneko_lua = {
    settings = {
      Lua = {
        runtime = {
          version = "LuaJIT",
        },
        diagnostics = {
          globals = { "vim" },
        },
        workspace = {
          library = {
            [vim.fn.expand("$VIMRUNTIME/lua")] = true,
            [vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
          },
          useGitignore = false,
          ignoreSubmodules = false,
        },
      },
    },
  },
}

require("nvim-lsp-installer.servers").register(require("yp.pylsp-custom"))

local capabilities = require("coq").lsp_ensure_capabilities()
local default_opts = { on_attach = on_attach, capabilities = capabilities }

lsp_installer.on_server_ready(function(server)
  local opts = server_configs[server.name]
  server:setup(opts and vim.tbl_deep_extend("force", default_opts, opts) or default_opts)
end)

local success, local_servers = pcall(require, "yp.local.local-lsp-servers")
if success then
  local lspconfig = require("lspconfig")
  for _, server in ipairs(local_servers) do
    local opts = server_configs[server]
    lspconfig[server].setup (opts and vim.tbl_deep_extend("force", default_opts, opts) or default_opts)
  end
end
