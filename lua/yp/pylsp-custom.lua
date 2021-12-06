local server = require("nvim-lsp-installer.server")
local pip3 = require("nvim-lsp-installer.installers.pip3")

local server_name = "pylsp"
local root_dir = server.get_server_root_path("pylsp")

return server.Server:new({
  name = server_name,
  root_dir = root_dir,
  languages = { "python" },
  homepage = "https://github.com/python-lsp/python-lsp-server",
  installer = pip3.packages({
    "python-lsp-server[mccabe,pyflakes]",
    "pylsp-mypy",
    "python-lsp-black",
    "pyls-isort",
    "pylsp-rope",
  }),
  default_options = {
    cmd = { pip3.executable(root_dir, "pylsp") },
  },
})
