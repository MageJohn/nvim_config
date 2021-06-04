local utils = {}

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

  vim.list_extend(args, {cmd, repl})

  vim.cmd(table.concat(args, " "))
end

return utils
