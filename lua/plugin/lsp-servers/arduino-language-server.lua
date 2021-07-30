local flatten_not_null = require('yp.utils').flatten_not_null
local path = require('yp.utils').path
local root_pattern = require('lspconfig/util').root_pattern

local function exe(name)
  if vim.fn.has('win32') == 1 then
    return name..".exe"
  else
    return name
  end
end

require('lspinstall/servers').arduino = {
  default_config = {
    cmd = {
      exe"./arduino-language-server",
      '-cli-config', path.join(vim.fn.stdpath('data'), 'lspinstall', 'arduino', 'arduino-cli.yaml')
    },
    filetypes = {"arduino"},
    arduino_cli_config = path.join(vim.fn.stdpath('data'), 'lspinstall', 'arduino', 'arduino-cli.yaml'),
    root_dir = root_pattern(".git", "compile_commands.json", "compile_flags.txt")
  },
  on_new_config = function(nc, _)
    vim.notify("in on_new_config")
    nc.cmd = vim.list_extend(nc.cmd, flatten_not_null {
      nc.clangd_exe and {'-clangd', nc.clangd_exe},
      nc.arduino_cli_exe and {'-cli', nc.arduino_cli_exe},
    })
  end
}
