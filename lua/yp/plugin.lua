-- Modified from tjdevries/astronauta.nvim

local has_sourced = false

local plugin = {}

plugin.source = function(force)
  if not force and has_sourced then
    return
  end

  for _, mod in ipairs(vim.api.nvim_get_runtime_file('lua/plugin/*.lua', true)) do
    local ok, msg = pcall(dofile, mod)

    if not ok then
      print("Error:", msg)
    end
  end

  has_sourced = true
end

return plugin
