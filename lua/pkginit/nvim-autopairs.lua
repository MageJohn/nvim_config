local npairs = require('nvim-autopairs')

npairs.setup({ enable_check_bracket_line = true })

for _, rule in ipairs( npairs.get_rule("'")) do
  if rule.not_filetypes ~= nil then
    table.insert(rule.not_filetypes, 'racket')
  end
end
