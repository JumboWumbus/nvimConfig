require("lvim.lsp.manager").setup("emmet_ls",{
  filetypes = { 'scss' },
  init_options = {
    html = {
      options = {
        -- For possible options, see: https://github.com/emmetio/emmet/blob/master/src/config.ts#L79-L267
        ["bem.enabled"] = true,
      },
    },
  }
})

require("lvim.lsp.manager").setup("tailwindcss")

-- local formatters = require "lvim.lsp.null-ls.formatters"
-- formatters.setup {
--   require("user.lsp.formatters").prettierd,
--   require("user.lsp.formatters").stylelint,
-- }

-- local linters = require "lvim.lsp.null-ls.linters"
-- linters.setup {
--   require("user.lsp.linters").stylelint,
-- }

local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
  {command = "prettierd"},
  -- {command = "stylelint"}
}

-- local linters = require "lvim.lsp.null-ls.linters"
-- linters.setup {
--   { command = "stylelint" },
  
-- }
