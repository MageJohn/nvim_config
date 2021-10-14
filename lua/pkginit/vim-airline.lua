-- Don't show mode (airline does this)
vim.opt.showmode = false

vim.g.airline_powerline_fonts = true
vim.g["airline#extensions#tabline#enabled"] = true

vim.g["airline#extensions#tabline#buffer_idx_mode"] = 3

local nmap = require("yp.utils").nmap

nmap('[b', '<Cmd>bnext<CR>')
nmap(']b', '<Cmd>bprev<CR>')
nmap('gb', 'printf("<Plug>AirlineSelectTab%02d", v:count1)', {expr=true})
