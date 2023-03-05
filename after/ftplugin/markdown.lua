require("lvim.lsp.manager").setup "marksman"
require("lvim.lsp.manager").setup("emmet_ls",{
  filetypes = { 'markdown' },
  init_options = {
    html = {
      options = {
        -- For possible options, see: https://github.com/emmetio/emmet/blob/master/src/config.ts#L79-L267
        ["bem.enabled"] = true,
      },
    },
  }
})

local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
  { command = "prettierd"}
}

local linters = require "lvim.lsp.null-ls.linters"
linters.setup {
  { command = "proselint",
   filetypes = { "markdown" } 
  },
}