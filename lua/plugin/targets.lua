-- Let the argument textobj work inside curly braces
require('yp.utils').autocmds('yp_targets', {
  {
    event = 'User',
    pat = 'targets#mappings#user',
    cmd = function()
      vim.fn['targets#mappings#extend']({
        a = {argument = { {o = '[{([]', c = '[])}]', s = ','} } }
      })
    end
  }
})
