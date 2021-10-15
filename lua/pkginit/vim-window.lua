local nmap = require"yp.utils".nmap
local command = require"yp.utils".command

-- Unimpaired mapping
nmap(']r', '<Cmd>call window#rotate(-1 * v:count1)<CR>')
nmap('[r', '<Cmd>call window#rotate(1 * v:count1)<CR>')

-- Improved window rotate to work with all layouts
nmap('<C-w>r', ']r')
nmap('<C-w><C-r>', ']r')

-- Improve window exchange to work with all layouts
nmap('<C-w>x', '<Cmd>call window#exchange(v:count)<CR>')
nmap('<C-w><c-x>', '<Cmd>call window#exchange(v:count)<CR>')

-- [g]lue windows together.
--    l = glue to right side
--    h = glue to left side
--    j = glue to bottom
--    k = glue to top
--
-- `normal! 100zh` scrolls window contents into view since it gets messy when
-- narrower window tries refocuses its cursor.
nmap('<C-w>gl', '<Cmd>call window#join("rightbelow vsplit", v:count) <BAR>normal! 100zh<CR>')
nmap('<C-w>gh', '<Cmd>call window#join("leftabove vsplit", v:count)  <BAR>normal! 100zh<CR>')
nmap('<C-w>gj', '<Cmd>call window#join("belowright split", v:count)  <BAR>normal! 100zh<CR>')
nmap('<C-w>gk', '<Cmd>call window#join("aboveleft split", v:count)   <BAR>normal! 100zh<CR>')

-- Force a primary window layout.
-- The capital HJKL forces the primary window to a specific direction.
command("LayoutH", "call window#layout('ball', 'H', <args>)", {nargs='*'}, true)
command("LayoutJ", "call window#layout('vertical ball', 'J', <args>)", {nargs='*'}, true)
command("LayoutK", "call window#layout('vertical ball', 'K', <args>)", {nargs='*'}, true)
command("LayoutL", "call window#layout('ball', 'L', <args>)", {nargs='*'}, true)

-- Map the layout commands to something if that's your style.
nmap('<C-w>gH', '<Cmd>LayoutH v:count<CR>')
nmap('<C-w>gJ', '<Cmd>LayoutJ v:count<CR>')
nmap('<C-w>gK', '<Cmd>LayoutK v:count<CR>')
nmap('<C-w>gL', '<Cmd>LayoutL v:count<CR>')

-- Improve window only, to split to new tab instead
nmap('<C-w>o', '<Cmd>call window#only()<CR>')
nmap('<C-w><c-o>', '<Cmd>call window#only()<CR>')

