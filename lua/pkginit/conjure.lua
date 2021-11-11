local autocmds = require("yp.utils").autocmds

autocmds("ConjureRemoveSponsor", {
  event = "BufWinEnter",
  pat = "conjure-log-*",
  cmd = "silent s/; Sponsored by @.*//e",
})
