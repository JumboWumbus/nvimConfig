require("lvim.lsp.manager").setup("emmet_ls")
require("lvim.lsp.manager").setup("tailwindcss")

local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
  { command = "prettierd"},
  { command = "stylelint"}
}

local linters = require "lvim.lsp.null-ls.linters"
linters.setup {
  { command = "stylelint",},
}