" Automatically generated packer.nvim plugin loader code

if !has('nvim-0.5')
  echohl WarningMsg
  echom "Invalid Neovim version for packer.nvim!"
  echohl None
  finish
endif

packadd packer.nvim

try

lua << END
  local time
  local profile_info
  local should_profile = false
  if should_profile then
    local hrtime = vim.loop.hrtime
    profile_info = {}
    time = function(chunk, start)
      if start then
        profile_info[chunk] = hrtime()
      else
        profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
      end
    end
  else
    time = function(chunk, start) end
  end
  
local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end

  _G._packer = _G._packer or {}
  _G._packer.profile_output = results
end

time("Luarocks path setup", true)
local package_path_str = "/Users/yuripieters/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/Users/yuripieters/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/Users/yuripieters/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/Users/yuripieters/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/Users/yuripieters/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time("Luarocks path setup", false)
time("try_loadstring definition", true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s))
  if not success then
    print('Error running ' .. component .. ' for ' .. name)
    error(result)
  end
  return result
end

time("try_loadstring definition", false)
time("Defining packer_plugins", true)
_G.packer_plugins = {
  ["base16-vim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/Users/yuripieters/.local/share/nvim/site/pack/packer/opt/base16-vim"
  },
  ["gina.vim"] = {
    loaded = true,
    path = "/Users/yuripieters/.local/share/nvim/site/pack/packer/start/gina.vim"
  },
  ["is.vim"] = {
    loaded = true,
    path = "/Users/yuripieters/.local/share/nvim/site/pack/packer/start/is.vim"
  },
  neoterm = {
    commands = { "T", "Tnew" },
    config = { "\27LJ\2\n>\0\0\2\0\4\0\0056\0\0\0009\0\1\0'\1\3\0=\1\2\0K\0\1\0\rbotright\24neoterm_default_mod\6g\bvim\0" },
    loaded = false,
    needs_bufread = true,
    path = "/Users/yuripieters/.local/share/nvim/site/pack/packer/opt/neoterm"
  },
  ["nvim-autopairs"] = {
    config = { "\27LJ\2\n^\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\1\30enable_check_bracket_line\2\nsetup\19nvim-autopairs\frequire\0" },
    loaded = true,
    path = "/Users/yuripieters/.local/share/nvim/site/pack/packer/start/nvim-autopairs"
  },
  ["nvim-compe"] = {
    loaded = true,
    path = "/Users/yuripieters/.local/share/nvim/site/pack/packer/start/nvim-compe"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/Users/yuripieters/.local/share/nvim/site/pack/packer/start/nvim-lspconfig"
  },
  ["nvim-lspinstall"] = {
    loaded = true,
    path = "/Users/yuripieters/.local/share/nvim/site/pack/packer/start/nvim-lspinstall"
  },
  ["oceanic-next"] = {
    loaded = false,
    needs_bufread = false,
    path = "/Users/yuripieters/.local/share/nvim/site/pack/packer/opt/oceanic-next"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/Users/yuripieters/.local/share/nvim/site/pack/packer/start/plenary.nvim"
  },
  ["popup.nvim"] = {
    loaded = true,
    path = "/Users/yuripieters/.local/share/nvim/site/pack/packer/start/popup.nvim"
  },
  ["specs.nvim"] = {
    loaded = true,
    path = "/Users/yuripieters/.local/share/nvim/site/pack/packer/start/specs.nvim"
  },
  ["targets.vim"] = {
    loaded = true,
    path = "/Users/yuripieters/.local/share/nvim/site/pack/packer/start/targets.vim"
  },
  ["telescope.nvim"] = {
    loaded = true,
    path = "/Users/yuripieters/.local/share/nvim/site/pack/packer/start/telescope.nvim"
  },
  undotree = {
    commands = { "UndotreeToggle" },
    loaded = false,
    needs_bufread = false,
    path = "/Users/yuripieters/.local/share/nvim/site/pack/packer/opt/undotree"
  },
  ["vim-abolish"] = {
    commands = { "Abolish", "Subvert", "S" },
    loaded = false,
    needs_bufread = false,
    path = "/Users/yuripieters/.local/share/nvim/site/pack/packer/opt/vim-abolish"
  },
  ["vim-airline"] = {
    loaded = true,
    path = "/Users/yuripieters/.local/share/nvim/site/pack/packer/start/vim-airline"
  },
  ["vim-airline-clock"] = {
    loaded = true,
    path = "/Users/yuripieters/.local/share/nvim/site/pack/packer/start/vim-airline-clock"
  },
  ["vim-airline-themes"] = {
    loaded = true,
    path = "/Users/yuripieters/.local/share/nvim/site/pack/packer/start/vim-airline-themes"
  },
  ["vim-asterisk"] = {
    config = { "\27LJ\2\n2\0\0\2\0\3\0\0056\0\0\0009\0\1\0+\1\2\0=\1\2\0K\0\1\0\21asterisk#keeppos\6g\bvim\0" },
    loaded = true,
    path = "/Users/yuripieters/.local/share/nvim/site/pack/packer/start/vim-asterisk"
  },
  ["vim-bbye"] = {
    commands = { "Bdelete", "Bwipeout" },
    loaded = false,
    needs_bufread = false,
    path = "/Users/yuripieters/.local/share/nvim/site/pack/packer/opt/vim-bbye"
  },
  ["vim-capslock"] = {
    loaded = true,
    path = "/Users/yuripieters/.local/share/nvim/site/pack/packer/start/vim-capslock"
  },
  ["vim-cutlass"] = {
    loaded = true,
    path = "/Users/yuripieters/.local/share/nvim/site/pack/packer/start/vim-cutlass"
  },
  ["vim-delete-hidden-buffers"] = {
    commands = { "DeleteHiddenBuffers" },
    loaded = false,
    needs_bufread = false,
    path = "/Users/yuripieters/.local/share/nvim/site/pack/packer/opt/vim-delete-hidden-buffers"
  },
  ["vim-just"] = {
    loaded = true,
    path = "/Users/yuripieters/.local/share/nvim/site/pack/packer/start/vim-just"
  },
  ["vim-octave"] = {
    loaded = true,
    path = "/Users/yuripieters/.local/share/nvim/site/pack/packer/start/vim-octave"
  },
  ["vim-sandwich"] = {
    loaded = true,
    path = "/Users/yuripieters/.local/share/nvim/site/pack/packer/start/vim-sandwich"
  },
  ["vim-scriptease"] = {
    commands = { "Messages", "Vopen" },
    loaded = false,
    needs_bufread = false,
    path = "/Users/yuripieters/.local/share/nvim/site/pack/packer/opt/vim-scriptease"
  },
  ["vim-signify"] = {
    loaded = false,
    needs_bufread = false,
    path = "/Users/yuripieters/.local/share/nvim/site/pack/packer/opt/vim-signify"
  },
  ["vim-startify"] = {
    loaded = true,
    path = "/Users/yuripieters/.local/share/nvim/site/pack/packer/start/vim-startify"
  },
  ["vim-subversive"] = {
    loaded = true,
    path = "/Users/yuripieters/.local/share/nvim/site/pack/packer/start/vim-subversive"
  },
  ["vim-textobj-entire"] = {
    loaded = true,
    path = "/Users/yuripieters/.local/share/nvim/site/pack/packer/start/vim-textobj-entire"
  },
  ["vim-textobj-fold"] = {
    loaded = true,
    path = "/Users/yuripieters/.local/share/nvim/site/pack/packer/start/vim-textobj-fold"
  },
  ["vim-textobj-indent"] = {
    loaded = true,
    path = "/Users/yuripieters/.local/share/nvim/site/pack/packer/start/vim-textobj-indent"
  },
  ["vim-textobj-python"] = {
    loaded = true,
    path = "/Users/yuripieters/.local/share/nvim/site/pack/packer/start/vim-textobj-python"
  },
  ["vim-textobj-syntax"] = {
    loaded = true,
    path = "/Users/yuripieters/.local/share/nvim/site/pack/packer/start/vim-textobj-syntax"
  },
  ["vim-textobj-user"] = {
    loaded = true,
    path = "/Users/yuripieters/.local/share/nvim/site/pack/packer/start/vim-textobj-user"
  },
  ["vim-textobj-variable-segment"] = {
    loaded = true,
    path = "/Users/yuripieters/.local/share/nvim/site/pack/packer/start/vim-textobj-variable-segment"
  },
  ["vim-toml"] = {
    loaded = true,
    path = "/Users/yuripieters/.local/share/nvim/site/pack/packer/start/vim-toml"
  },
  ["vim-vinegar"] = {
    keys = { { "", "-" } },
    loaded = false,
    needs_bufread = false,
    path = "/Users/yuripieters/.local/share/nvim/site/pack/packer/opt/vim-vinegar"
  },
  ["vim-window"] = {
    loaded = true,
    path = "/Users/yuripieters/.local/share/nvim/site/pack/packer/start/vim-window"
  },
  ["vim-wren"] = {
    loaded = true,
    path = "/Users/yuripieters/.local/share/nvim/site/pack/packer/start/vim-wren"
  },
  ["vim-yoink"] = {
    loaded = true,
    path = "/Users/yuripieters/.local/share/nvim/site/pack/packer/start/vim-yoink"
  }
}

time("Defining packer_plugins", false)
-- Config for: vim-asterisk
time("Config for vim-asterisk", true)
try_loadstring("\27LJ\2\n2\0\0\2\0\3\0\0056\0\0\0009\0\1\0+\1\2\0=\1\2\0K\0\1\0\21asterisk#keeppos\6g\bvim\0", "config", "vim-asterisk")
time("Config for vim-asterisk", false)
-- Config for: nvim-autopairs
time("Config for nvim-autopairs", true)
try_loadstring("\27LJ\2\n^\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\1\30enable_check_bracket_line\2\nsetup\19nvim-autopairs\frequire\0", "config", "nvim-autopairs")
time("Config for nvim-autopairs", false)

-- Command lazy-loads
time("Defining lazy-load commands", true)
vim.cmd [[command! -nargs=* -range -bang -complete=file UndotreeToggle lua require("packer.load")({'undotree'}, { cmd = "UndotreeToggle", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]
vim.cmd [[command! -nargs=* -range -bang -complete=file Abolish lua require("packer.load")({'vim-abolish'}, { cmd = "Abolish", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]
vim.cmd [[command! -nargs=* -range -bang -complete=file Subvert lua require("packer.load")({'vim-abolish'}, { cmd = "Subvert", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]
vim.cmd [[command! -nargs=* -range -bang -complete=file Messages lua require("packer.load")({'vim-scriptease'}, { cmd = "Messages", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]
vim.cmd [[command! -nargs=* -range -bang -complete=file Vopen lua require("packer.load")({'vim-scriptease'}, { cmd = "Vopen", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]
vim.cmd [[command! -nargs=* -range -bang -complete=file Bwipeout lua require("packer.load")({'vim-bbye'}, { cmd = "Bwipeout", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]
vim.cmd [[command! -nargs=* -range -bang -complete=file Tnew lua require("packer.load")({'neoterm'}, { cmd = "Tnew", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]
vim.cmd [[command! -nargs=* -range -bang -complete=file S lua require("packer.load")({'vim-abolish'}, { cmd = "S", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]
vim.cmd [[command! -nargs=* -range -bang -complete=file T lua require("packer.load")({'neoterm'}, { cmd = "T", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]
vim.cmd [[command! -nargs=* -range -bang -complete=file DeleteHiddenBuffers lua require("packer.load")({'vim-delete-hidden-buffers'}, { cmd = "DeleteHiddenBuffers", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]
vim.cmd [[command! -nargs=* -range -bang -complete=file Bdelete lua require("packer.load")({'vim-bbye'}, { cmd = "Bdelete", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]
time("Defining lazy-load commands", false)

-- Keymap lazy-loads
time("Defining lazy-load keymaps", true)
vim.cmd [[noremap <silent> - <cmd>lua require("packer.load")({'vim-vinegar'}, { keys = "-", prefix = "" }, _G.packer_plugins)<cr>]]
time("Defining lazy-load keymaps", false)

vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Filetype lazy-loads
time("Defining lazy-load filetype autocommands", true)
vim.cmd [[au FileType netrw ++once lua require("packer.load")({'vim-vinegar'}, { ft = "netrw" }, _G.packer_plugins)]]
time("Defining lazy-load filetype autocommands", false)
  -- Event lazy-loads
time("Defining lazy-load event autocommands", true)
vim.cmd [[au BufNewFile * ++once lua require("packer.load")({'vim-signify'}, { event = "BufNewFile *" }, _G.packer_plugins)]]
vim.cmd [[au BufRead * ++once lua require("packer.load")({'vim-signify'}, { event = "BufRead *" }, _G.packer_plugins)]]
time("Defining lazy-load event autocommands", false)
vim.cmd("augroup END")
if should_profile then save_profiles() end

END

catch
  echohl ErrorMsg
  echom "Error in packer_compiled: " .. v:exception
  echom "Please check your config for correctness"
  echohl None
endtry
