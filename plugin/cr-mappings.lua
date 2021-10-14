YP = YP or {}

local function escape(cmd)
  return vim.api.nvim_replace_termcodes(cmd, true, false, true)
end

function YP.cr_mapping()
  if vim.fn.pumvisible() ~= 0 then
    if vim.fn.complete_info()["selected"] ~= -1 then
      return vim.fn["compe#confirm"]("<CR>")
    else
      return escape("<CR>")
    end
  else
    return require('nvim-autopairs').autopairs_cr()
  end
end

vim.api.nvim_set_keymap(
  'i',
  '<CR>',
  'v:lua.YP.cr_mapping()',
  {expr=true, noremap=true, silent=true}
)
