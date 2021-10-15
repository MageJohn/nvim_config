* [x] Make sure language servers are working
  * [x] nvim-lspconfig & nvim-lspinstall
  * [x] autocompletion
* [ ] Move to packer.nvim
  * [x] Install all plugin with packer.nvim, removing minpac
  * [ ] Go through each plugin and consider if lazy loading is possible
  * [x] Go through each plugin and move it's config out of init.vim, so that
    it's only run when when the plugin is loaded.
* [ ] Move to an init.lua. Should do after plugin config has been moved to
  separate files.
* [ ] Configure tree-sitter
* [ ] CLI to manage packages more statically
  * Maybe the CLI can manage transpiling Lua plugins
