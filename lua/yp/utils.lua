local utils = {}

YP = YP or {}

YP.commands = {}

---@param cmd string
---@param repl string
---@param attrs? table<number | string, string | number | boolean>
---@param redefine? boolean
utils.command = function(cmd, repl, attrs, redefine)
  local args = {
    (redefine and "command!") or "command"
  }

  if attrs ~= nil then
    for k, v in pairs(attrs) do
      local k_t, v_t = type(k), type(v)
      if (k_t == "number" and v_t == "string") then
        table.insert(args, string.format("-%s", v))
      elseif k_t == "string" and (v_t == "string" or v_t == "number") then
        table.insert(args, string.format("-%s=%s", k, v))
      elseif k_t == "string" and v_t == "boolean" then
        if v then table.insert(args, string.format("-%s", k)) end
      else
        error(string.format("Invalid attr spec: [%s]=%s", k, v))
      end
    end
  end

  table.insert(args, cmd)

  if type(repl) == 'function' then
    YP.commands[cmd] = repl
    table.insert(args, ('lua YP.commands["%s"](<f-args>)'):format(cmd))
  else
    table.insert(args, repl)
    if YP.commands[cmd] ~= nil then
      YP.commands[cmd] = nil
    end
  end

  vim.cmd(table.concat(args, " "))
end


YP.autocommands = setmetatable({}, {
  __index = function(table, key)
    table[key] = {}
    return table[key]
  end,
})

---@param group string
---@param autocmds table
utils.autocmds = function(group, autocmds)
  vim.cmd(("augroup %s | autocmd!"):format(group))
  for i, def in ipairs(autocmds) do
    local cmd
    if type(def.cmd) == 'function' then
      local group_cmds = YP.autocommands[group]
      group_cmds[i] = def.cmd
      cmd = ('lua YP.autocommands["%s"][%d]()'):format(group, i)
    elseif type(def.cmd) == 'string' then
      cmd = def.cmd
    elseif def.cmd == nil then
      error(string.format(("cmd not given for autocommand with index %d in augroup %s"):format(i, group)))
    else
      error(string.format(("Invalid command passed for autocommand with index %d in augroup %s"):format(i, group)))
    end

    local once = ''
    if def.once then once = '++once' end
    local nested = ''
    if def.nested then nested = '++nested' end

    vim.cmd(table.concat({"autocmd", def.event, def.pat, once, nested, cmd}, ' '))
  end

  vim.cmd('augroup END')
end


---@param t table
function utils.flatten_not_null(t)
  return vim.tbl_filter(
    function(v) return v ~= nil end,
    vim.tbl_flatten(t)
  )
end

utils.path = {}

local pathsep = package.config:sub(1, 1)
function utils.path.join(...)
  local result = table.concat({...}, pathsep):gsub(pathsep..pathsep..'+', pathsep)
  return result
end

--Lua equivalent to :map
--@param lhs string
--@param rhs string
--@param opts table
function utils.map(lhs, rhs, opts)
  return vim.api.nvim_set_keymap('', lhs, rhs, opts or {})
end

function utils.map_bang(lhs, rhs, opts)
  return vim.api.nvim_set_keymap('!', lhs, rhs, opts or {})
end

for _,mode in ipairs {'', 'n', 'v', 'x', 's', 'o', 'i', 'l', 'c', 't'} do
  utils[mode..'map'] = function(lhs, rhs, opts)
    return vim.api.nvim_set_keymap(mode, lhs, rhs, opts or {})
  end
end

return utils
