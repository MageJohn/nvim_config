if exists("g:GuiLoaded")
    " A gui using nvim-qt's nvim-gui-shim is loaded
    call GuiWindowMaximized(1)
    GuiTabline 0
endif
set guifont=Fira\ Code:h13

let s:local_ginit_file = stdpath("config") .. "/ginit.local.vim"
if filereadable(s:local_ginit_file)
    execute "source" s:local_ginit_file
endif
