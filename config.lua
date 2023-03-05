--[[
 THESE ARE EXAMPLE CONFIGS FEEL FREE TO CHANGE TO WHATEVER YOU WANT
 `lvim` is the global options object
]]
-- Enable powershell as your default shell

require("user.plugins")
require("user.bookmark")
require("user.mappings")
require("utils.cheat_sh")

vim.opt.shell = "pwsh.exe -NoLogo"
vim.opt.shellcmdflag =
	"-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;"
vim.cmd([[
		let &shellredir = '2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode'
		let &shellpipe = '2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode'
		set shellquote= shellxquote=
  ]])

-- Set a compatible clipboard manager
vim.g.clipboard = {
	copy = {
		["+"] = "win32yank.exe -i --crlf",
		["*"] = "win32yank.exe -i --crlf",
	},
	paste = {
		["+"] = "win32yank.exe -o --lf",
		["*"] = "win32yank.exe -o --lf",
	},
}

-- vim options
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.autochdir = true

-- general
lvim.log.level = "info"
lvim.format_on_save = {
	enabled = true,
	timeout = 1000,
}

vim.o.termguicollors = true

--For dark version.
--set background=dark
--For light version.
vim.o.background = "dark"

-- material, mix, original
vim.g.gruvbox_material_foreground = "material"

--soft, medium, hard
vim.g.gruvbox_material_background = "soft"
vim.g.gruvbox_material_dim_inactive_windows = 0
vim.g.gruvbox_material_ui_contrast = "low" --low,high
vim.g.gruvbox_material_transparent_background = 0

vim.g.gruvbox_material_diagnostic_line_highlight = 1
vim.g.gruvbox_material_diagnostic_text_highlight = 1
vim.g.gruvbox_material_enable_italic = 1

vim.g.gruvbox_material_cursor = "orange"
vim.g.gruvbox_material_disable_italic_comment = 0
vim.g.gruvbox_material_enable_bold = 1

--For better performance
vim.g.gruvbox_material_better_performance = 1

lvim.colorscheme = "gruvbox-material"

vim.opt.textwidth = 0
vim.cmd([[
set wrap
set wrapmargin=0
set linebreak
]])

vim.api.nvim_create_autocmd("FileType", {
	pattern = {
		"lua",
		"json",
		"jsonc",
		"typescript",
		"typescriptreact.tsx",
		"typescriptreact",
		"javascriptreact",
		"javascriptreact.tsx",
		"javascript",
		"java",
		"markdown",
		"scss",
		"sass",
		"css",
	},
	command = [[
      setlocal tw=70
      setlocal colorcolumn=70
      setlocal colorcolumn+=120
      set formatoptions+=t
      ]],
})

-- to disable icons and use a minimalist setup, uncomment the following
-- lvim.use_icons = false

-- keymappings <https://www.lunarvim.org/docs/configuration/keybindings>
lvim.leader = "space"
-- add your own keymapping
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
lvim.keys.term_mode["<C-x>"] = "<C-\\><C-N>"
lvim.keys.normal_mode["<S-h>"] = "<cmd>BufferLineCyclePrev<cr>"
lvim.keys.normal_mode["<S-l>"] = "<cmd>BufferLineCycleNext<cr>"

lvim.keys.normal_mode["<C-t>"] = "<cmd>ToggleTerm dir=git_dir direction=float<cr>"

--:Cheat<cr>

lvim.builtin.which_key.mappings["n"] = {
	name = "Custom Zone",
	t = { "<cmd>tabnew<cr>", "New Tab" },
	b = { "<cmd>Telescope bookmarks<cr>", "Web Bookmarks" },
	n = { "<cmd>set nu!<cr>", "Line Number" },
	r = { "<cmd>set rnu!<cr>", "Relative Line Number" },
}

lvim.builtin.alpha.active = true
-- lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.setup.renderer.icons.show.git = false
lvim.builtin.nvimtree.active = true
lvim.builtin.lir.active = true



-- Automatically install missing parsers when entering buffer
lvim.builtin.treesitter.auto_install = true
--lvim.builtin.treesitter.highlight.enable = true

lvim.lsp.installer.setup.automatic_installation = true

lvim.builtin.bufferline.options.separator_style = "thick"

lvim.lsp.automatic_configuration.skipped_servers = vim.tbl_filter(function(server)
	return server ~= "emmet_ls"
end, lvim.lsp.automatic_configuration.skipped_servers)

lvim.autocommands = {
	{
		{ "BufNewFile", "BufRead" },
		{
			pattern = { "*.md" },
			command = ":set ft=markdown",
		},
	},
}

lvim.autocommands = {
	{
		{ "BufNewFile", "BufRead" },
		{
			pattern = { "*.mdx" },
			command = ":set ft=mdx",
		},
	},
}

-- local formatters = require "lvim.lsp.null-ls.formatters"
-- formatters.setup {
--   {
--     command = "prettier",
--   },
--   {
--     command = "eslint_d",
--   },
-- }

-- local code_actions = require "lvim.lsp.null-ls.code_actions"
-- code_actions.setup {
--   {
--     command = "proselint",
--     args = { "--json" },
--     filetypes = { "markdown", "tex" },
--   },
-- }

-- lvim.builtin.treesitter.ignore_install = { "haskell" }

-- -- ensure these parsers are always installed, useful for those without a strict filetype
-- lvim.builtin.treesitter.ensure_installed = { "comment", "markdown_inline", "regex" }

-- -- generic LSP settings <https://www.lunarvim.org/docs/languages#lsp-support>

-- --- disable automatic installation of servers
-- lvim.lsp.installer.setup.automatic_installation = false

-- ---configure a server manually. IMPORTANT: Requires `:LvimCacheReset` to take effect
-- ---see the full default list `:lua =lvim.lsp.automatic_configuration.skipped_servers`
-- vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "pyright" })
-- local opts = {} -- check the lspconfig documentation for a list of all possible options
-- require("lvim.lsp.manager").setup("pyright", opts)

-- ---remove a server from the skipped list, e.g. eslint, or emmet_ls. IMPORTANT: Requires `:LvimCacheReset` to take effect
-- ---`:LvimInfo` lists which server(s) are skipped for the current filetype
-- lvim.lsp.automatic_configuration.skipped_servers = vim.tbl_filter(function(server)
--   return server ~= "emmet_ls"
-- end, lvim.lsp.automatic_configuration.skipped_servers)

-- -- you can set a custom on_attach function that will be used for all the language servers
-- -- See <https://github.com/neovim/nvim-lspconfig#keybindings-and-completion>
-- lvim.lsp.on_attach_callback = function(client, bufnr)
--   local function buf_set_option(...)
--     vim.api.nvim_buf_set_option(bufnr, ...)
--   end
--   --Enable completion triggered by <c-x><c-o>
--   buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
-- end

-- -- linters and formatters <https://www.lunarvim.org/docs/languages#lintingformatting>
-- local formatters = require "lvim.lsp.null-ls.formatters"
-- formatters.setup {
--   { command = "stylua" },
--   {
--     command = "prettier",
--     extra_args = { "--print-width", "100" },
--     filetypes = { "typescript", "typescriptreact" },
--   },
-- }
-- local linters = require "lvim.lsp.null-ls.linters"
-- linters.setup {
--   { command = "flake8", filetypes = { "python" } },
--   {
--     command = "shellcheck",
--     args = { "--severity", "warning" },
--   },
-- }

-- -- Additional Plugins <https://www.lunarvim.org/docs/plugins#user-plugins>
-- lvim.plugins = {
--     {
--       "folke/trouble.nvim",
--       cmd = "TroubleToggle",
--     },
-- }

-- -- Autocommands (`:help autocmd`) <https://neovim.io/doc/user/autocmd.html>
-- vim.api.nvim_create_autocmd("FileType", {
--   pattern = "zsh",
--   callback = function()
--     -- let treesitter use bash highlight for zsh files as well
--     require("nvim-treesitter.highlight").attach(0, "bash")
--   end,
-- })
--   end,
-- })
