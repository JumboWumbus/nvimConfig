require("lvim.lsp.manager").setup "marksman"
require("lvim.lsp.manager").setup("emmet_ls",{
  filetypes = { 'md', 'markdown' },
  init_options = {
    html = {
      options = {
        -- For possible options, see: https://github.com/emmetio/emmet/blob/master/src/config.ts#L79-L267
        ["bem.enabled"] = true,
      },
    },
  }
})

-- require("lvim.lsp.manager").setup("proselint",{
--   filetypes = { 'md', 'markdown' },
--   init_options = {
--     html = {
--       options = {
--         -- For possible options, see: https://github.com/emmetio/emmet/blob/master/src/config.ts#L79-L267
--         ["bem.enabled"] = true,
--       },
--     },
--   }
-- })

local linters = require "lvim.lsp.null-ls.linters"
linters.setup {
  { command = "proselint", filetypes = { "md" } },
}



--------- Example of setting up formatters etc -------------------

-- local formatters = require "lvim.lsp.null-ls.formatters"
-- formatters.setup {
--   { command = "black" },
--   {
--     command = "prettier",
--     args = { "--print-width", "100" },
--     filetypes = { "typescript", "typescriptreact" },
--   },
-- }

-- local linters = require "lvim.lsp.null-ls.linters"
-- linters.setup {
--   { command = "flake8" },
--   {
--     command = "shellcheck",
--     args = { "--severity", "warning" },
--   },
--   {
--     command = "codespell",
--     filetypes = { "javascript", "python" },
--   },
-- }

-- local code_actions = require "lvim.lsp.null-ls.code_actions"
-- code_actions.setup {
--   {
--     command = "proselint"
--   },
-- }