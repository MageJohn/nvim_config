require 'compe'.setup {
  enabled = true;
  autocomplete = true;
  debug = false;
  min_length = 2;
  preselect = 'enable';
  throttle_time = 80;
  source_timeout = 200;
  incomplete_delay = 400;
  max_abbr_width = 100;
  max_kind_width = 100;
  max_menu_width = 100;
  documentation = true;

  source = {
    path = true;
    buffer = true;
    calc = false;
    nvim_lsp = true;
    nvim_lua = true;
    vsnip = false;
    ultisnips = false;
  };
}

---@param lhs string
---@param rhs string
local inoremap = function(lhs, rhs)
  vim.api.nvim_set_keymap('i', lhs, rhs, { silent=true, expr=true, noremap=true })
end

inoremap('<C-Space>', 'compe#complete()')
inoremap('<C-e>', "compe#close('<C-e>'")
inoremap('<C-f>', "compe#scroll({ 'delta': +4 })")
inoremap('<C-d>', "compe#scroll({ 'delta': -4 })")
