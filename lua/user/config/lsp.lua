local formatters = require("lvim.lsp.null-ls.formatters")
formatters.setup({
  {
    command = "prettierd",
    extra_args = { "--print-with", "70" },
    filetypes = { "typescript", "typescriptreact", "javascript", "javascriptreact", "astro" },
  },
  { command = "stylua",        filetypes = { "lua" } },
  { command = "sql-formatter", filetypes = { "sql" } },
})

-- set additional linters
local linters = require("lvim.lsp.null-ls.linters")
linters.setup({
  {
    command = "eslint_d",
    filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
  },
  {
    command = "luacheck",
    filetypes = { "lua" },
  },
})

require("lspconfig").astro.setup({})
require("lspconfig").emmet_ls.setup({})