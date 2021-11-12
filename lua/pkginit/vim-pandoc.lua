vim.g["pandoc#folding#level"] = 99
vim.g["pandoc#folding#fastfolds"] = true
vim.g["pandoc#completion#bib#mode"] = "fallback"
vim.g["pandoc#biblio#sources"] = "ybcgG"
vim.g["pandoc#formatting#mode"] = "hA"

COQsources = COQsources or {}
table.insert(COQsources, {
  name = "BIB",
  fn = require("yp.coq_omnifunc")({
    use_cache = true,
    omnifunc = "pandoc#completion#Complete",
    filetypes = { "pandoc" },
  }),
})
