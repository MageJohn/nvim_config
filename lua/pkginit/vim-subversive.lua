local utils = require'yp.utils'
local nmap,xmap = utils.nmap,utils.xmap

nmap('s', '<plug>(SubversiveSubstitute)')
nmap('ss', '<plug>(SubversiveSubstituteLine)')
nmap('S', '<plug>(SubversiveSubstituteToEndOfLine)')

xmap('p', '<plug>(SubversiveSubstitute)')
xmap('P', '<plug>(SubversiveSubstitute)')

nmap('<Leader>s', '<plug>(SubversiveSubstituteRangeNoPrompt)')
xmap('<Leader>s', '<plug>(SubversiveSubstituteRangeNoPrompt)')

vim.g.subversivePromptWithActualCommand = true
nmap('<Leader>ss', '<plug>(SubversiveSubstituteWordRange)')
