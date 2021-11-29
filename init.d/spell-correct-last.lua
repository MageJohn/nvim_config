local utils = require("yp.utils")

local namespace = vim.api.nvim_create_namespace("")

YP = YP or {}
YP.mappings = YP.mappings or {}
function YP.mappings.correctLast()
  local rowA, colA = unpack(vim.api.nvim_win_get_cursor(0))
  local extmark = vim.api.nvim_buf_set_extmark(0, namespace, rowA - 1, colA, {})
  vim.cmd("normal! [s1z=")
  local rowB, colB = unpack(vim.api.nvim_buf_get_extmark_by_id(0, namespace, extmark, {}))
  vim.api.nvim_win_set_cursor(0, {rowB + 1, colB})
end

utils.imap("<c-s>", "<Cmd>lua YP.mappings.correctLast()<CR>")
