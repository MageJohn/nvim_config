" Source files in lua/plugin
" The idea is to match the behaviour of how vimL files in runtimepath/plugin
" will be sourced at startup.
lua require'yp.plugin'.source()
