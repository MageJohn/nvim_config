if exists("g:GuiLoaded")
    " A gui using nvim-qt's nvim-gui-shim is loaded
    call GuiWindowMaximized(1)
    GuiTabline 0
endif
set guifont=Hack:h11

execute "source" stdpath("config") .. "/ginit.local.vim"
