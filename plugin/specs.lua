local specs = require 'specs'

specs.setup {
  show_jumps  = true,
  min_jump = 25,
  popup = {
      delay_ms = 0, -- delay before popup displays
      inc_ms = 3, -- time increments used for fade/resize effects
      blend = 0, -- starting blend, between 0-100 (fully transparent), see :h winblend
      width = 50,
      winhl = "Cursor",
      fader = function(start_blend, cnt)
        local blend = start_blend + math.floor(math.exp(cnt/10))
        if blend <= 100 then return blend
        else return nil end
      end,
      resizer = function(base_width, cursor_col, count)
        if count <= 100 then
          local factor = count / 100
          if count > 50 then factor = 1 - factor end
          local width = math.floor(base_width * factor)
          return {width, cursor_col-(width/2)}
        else return nil end
      end
    },
  ignore_filetypes = {},
  ignore_buftypes = {
      nofile = true,
  },
}
