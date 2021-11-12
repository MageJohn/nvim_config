-- Combined configuration for auto-completion and autopairs.

local npairs = require("nvim-autopairs")
npairs.setup({
  enable_check_bracket_line = true,
  map_bs = false,
  map_cr = false,
})

for _, rule in ipairs(npairs.get_rule("'")) do
  if rule.not_filetypes ~= nil then
    table.insert(rule.not_filetypes, "racket")
  end
end

local function remap(mode, lhs, rhs)
  return vim.api.nvim_set_keymap(mode, lhs, rhs, { expr = true, noremap = true })
end

vim.g.coq_settings = {
  keymap = { recommended = false },
  auto_start = "shut-up",
}

remap("i", "<esc>", [[pumvisible() ? "<c-e><esc>" : "<esc>"]])
remap("i", "<c-c>", [[pumvisible() ? "<c-e><c-c>" : "<c-c>"]])
remap("i", "<tab>", [[pumvisible() ? "<c-n>" : "<tab>"]])
remap("i", "<s-tab>", [[pumvisible() ? "<c-p>" : "<bs>"]])

YP = YP or {}

function YP.cr_mapping()
  if vim.fn.pumvisible() ~= 0 then
    if vim.fn.complete_info({ "selected" }).selected ~= -1 then
      return npairs.esc("<c-y>")
    else
      return npairs.esc("<c-e>") .. npairs.autopairs_cr()
    end
  else
    return npairs.autopairs_cr()
  end
end
remap("i", "<cr>", "v:lua.YP.cr_mapping()")

function YP.bs_mapping()
  if vim.fn.pumvisible() ~= 0 and vim.fn.complete_info({ "mode" }).mode == "eval" then
    return npairs.esc("<c-e>") .. npairs.autopairs_bs()
  else
    return npairs.autopairs_bs()
  end
end
remap("i", "<bs>", "v:lua.YP.bs_mapping()")

function YP.c_w_mapping()
  if vim.fn.pumvisible() ~= 0 then
    return npairs.esc("<c-e>") .. npairs.autopairs_c_w()
  else
    return npairs.autopairs_c_w()
  end
end
remap("i", "<c-w>", "v:lua.YP.c_w_mapping()")
