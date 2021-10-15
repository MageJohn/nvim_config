vim.g.textobj_python_no_default_key_mappings = true
require"yp.utils".autocmds("init_textobj_python", {
  {
    event = "FileType",
    pat = "python",
    cmd = function()
      vim.fn["textobj#user#map"]('python', {
           ['class'] = {
             ['select-a'] = '<buffer>aC',
             ['select-i'] = '<buffer>iC',
             ['move-n'] = '<buffer>]C',
             ['move-p'] = '<buffer>[C',
           },
           ['function'] = {
             ['select-a'] = '<buffer>af',
             ['select-i'] = '<buffer>if',
             ['move-n'] = '<buffer>]f',
             ['move-p'] = '<buffer>[f',
           }
      })
    end
  }
})
