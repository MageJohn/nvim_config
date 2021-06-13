local actions = require 'telescope.actions'

require("telescope").setup {
  defaults = require('telescope.themes').get_ivy {
    mappings = {
      i = {
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,
        ["<esc>"] = actions.close,
      }
    }
  }
}

---@param lhs string
---@param telescope_picker string
local function telescope_nmap(lhs, telescope_picker)
  vim.api.nvim_set_keymap(
    'n',
    lhs,
    ("<Cmd>lua require('telescope.builtin').%s()<CR>"):format(telescope_picker),
    { noremap=true }
  )
end

telescope_nmap('<leader>ff', 'find_files')
telescope_nmap('<leader>~', 'buffers')
telescope_nmap('<leader>hk', 'keymaps')

