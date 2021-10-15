local nmap = require"yp.utils".nmap
local xmap = require"yp.utils".xmap

vim.g.textobj_sandwich_no_default_key_mappings = true
vim.g.sandwich_no_default_key_mappings = true

nmap('sm', '<Plug>(operator-sandwich-add)')
xmap('sm', '<Plug>(operator-sandwich-add)')

nmap('sd', '<Plug>(operator-sandwich-delete)<Plug>(operator-sandwich-release-count)<Plug>(textobj-sandwich-query-a)')
nmap('sdb', '<Plug>(operator-sandwich-delete)<Plug>(operator-sandwich-release-count)<Plug>(textobj-sandwich-auto-a)')
nmap('sr', '<Plug>(operator-sandwich-replace)<Plug>(operator-sandwich-release-count)<Plug>(textobj-sandwich-query-a)')
nmap('srb', '<Plug>(operator-sandwich-replace)<Plug>(operator-sandwich-release-count)<Plug>(textobj-sandwich-auto-a)')
xmap('sd', '<Plug>(operator-sandwich-delete)')
xmap('sr', '<Plug>(operator-sandwich-replace)')

--   >> Recipes >>>
local recipes = vim.fn.deepcopy({vim.g["sandwich#default_recipes"]})
vim.list_extend(recipes, {
   {
     buns = {'(', ')'},
     cursor = 'head',
     command = {'startinsert'},
     kind = {'add', 'replace'},
     action = {'add'},
     input = {'f'}
   },
   {
     buns = {'*', '*'}
   },
   {
     buns = {'$', '$'}
   },
   {
     buns = {'"""', '"""'},
     input = {'m'},
     filetype = {'python'}
   }
 }
)
vim.g["sandwich#recipes"] = recipes
