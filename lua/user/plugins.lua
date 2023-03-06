lvim.plugins = {
  {
    "sainnhe/gruvbox-material",
    lazy = false,
    priority = 1000
  },
  {
    'goolord/alpha-nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require("user.config.alpha")
    end
  },
  {
    "MattesGroeger/vim-bookmarks",
    event = "VeryLazy"
  },

  {
    "max397574/better-escape.nvim",
    lazy = false,
    config = function()
      require("better_escape").setup()
    end,
  },

  {
    "lukas-reineke/virt-column.nvim",
    lazy = true,
    init = function()
      require("virt-column").setup()
    end,
  },

  {
    "folke/todo-comments.nvim",
    lazy = true,
    event = "BufRead",
    config = function()
      require("todo-comments").setup()
    end,
  },

  {
    "windwp/nvim-ts-autotag",
    event = "VeryLazy",
    config = function()
      require("nvim-ts-autotag").setup()
      -- require'nvim-treesitter.configs'.setup {
      --   autotag = {
      --     enable = true,
      --   }
      -- }
    end,
  },

  {
    "dhruvmanila/telescope-bookmarks.nvim",
    event = "VeryLazy",
    init = function()
      require("telescope").load_extension("bookmarks")
    end
  },
  {
    "stevearc/dressing.nvim",
    event = "VeryLazy",
    config = function()
      require('dressing').setup({
        input = {
          -- Set to false to disable the vim.ui.input implementation
          enabled = true,
          -- Default prompt string
          default_prompt = "Input:",
          -- Can be 'left', 'right', or 'center'
          prompt_align = "left",
          -- When true, <Esc> will close the modal
          insert_only = true,
          -- When true, input will start in insert mode.
          start_in_insert = true,
          -- These are passed to nvim_open_win
          anchor = "SW",
          border = "rounded",
          -- 'editor' and 'win' will default to being centered
          relative = "editor",
          -- These can be integers or a float between 0 and 1 (e.g. 0.4 for 40%)
          prefer_width = 40,
          width = nil,
          -- min_width and max_width can be a list of mixed types.
          -- min_width = {20, 0.2} means "the greater of 20 columns or 20% of total"
          max_width = { 140, 0.9 },
          min_width = { 20, 0.2 },
          buf_options = {},
          win_options = {
            -- Window transparency (0-100)
            winblend = 10,
            -- Disable line wrapping
            wrap = false,
          },
          -- Set to `false` to disable
          mappings = {
            n = {
                  ["<Esc>"] = "Close",
                  ["<CR>"] = "Confirm",
            },
            i = {
                  ["<C-c>"] = "Close",
                  ["<CR>"] = "Confirm",
                  ["<Up>"] = "HistoryPrev",
                  ["<Down>"] = "HistoryNext",
            },
          },
          override = function(conf)
            -- This is the config that will be passed to nvim_open_win.
            -- Change values here to customize the layout
            return conf
          end,
          -- see :help dressing_get_config
          get_config = nil,
        },
      })
    end,
  },

  {
    "jedrzejboczar/possession.nvim",
    event = "VeryLazy",
    config = function()
      require('possession').setup {
        --session_dir = (Path:new(vim.fn.stdpath('data')) / 'possession'):absolute(),
        silent = false,
        load_silent = true,
        debug = false,
        logfile = false,
        prompt_no_cr = false,
        autosave = {
          current = false, -- or fun(name): boolean
          tmp = false,     -- or fun(): boolean
          tmp_name = 'tmp',
          on_load = true,
          on_quit = true,
        },
        commands = {
          save = 'SSave',
          load = 'SLoad',
          delete = 'SDelete',
          list = 'SList',
        },
        hooks = {
          before_save = function(name) return {} end,
          after_save = function(name, user_data, aborted)
          end,
          before_load = function(name, user_data) return user_data end,
          after_load = function(name, user_data)
          end,
        },
        plugins = {
          close_windows = {
            hooks = { 'before_save', 'before_load' },
            preserve_layout = true, -- or fun(win): boolean
            match = {
              floating = true,
              buftype = {},
              filetype = {},
              custom = false, -- or fun(win): boolean
            },
          },
          delete_hidden_buffers = {
            hooks = {
              'before_load',
              vim.o.sessionoptions:match('buffer') and 'before_save',
            },
            force = false, -- or fun(buf): boolean
          },
          nvim_tree = true,
          tabby = true,
          dap = true,
          delete_buffers = false,
        },
      }
    end,
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
  },

  {
    "karb94/neoscroll.nvim",
    lazy = true,
    event = "WinScrolled",
    config = function()
      require('neoscroll').setup({
        -- All these keys will be mapped to their corresponding default scrolling animation
        mappings = { '<C-u>', '<C-d>', '<C-b>', '<C-f>',
          '<C-y>', '<C-e>', 'zt', 'zz', 'zb' },
        hide_cursor = true,          -- Hide cursor while scrolling
        stop_eof = true,             -- Stop at <EOF> when scrolling downwards
        use_local_scrolloff = false, -- Use the local scope of scrolloff instead of the global scope
        respect_scrolloff = false,   -- Stop scrolling when the cursor reaches the scrolloff margin of the file
        cursor_scrolls_alone = true, -- The cursor will keep on scrolling even if the window cannot scroll further
        easing_function = nil,       -- Default easing function
        pre_hook = nil,              -- Function to run before the scrolling animation starts
        post_hook = nil,             -- Function to run after the scrolling animation ends
      })
    end
  },
  {
    "dhruvasagar/vim-table-mode",
    event = "VeryLazy",
  },
  {
    "folke/trouble.nvim",
    lazy = true,
    cmd = "TroubleToggle",
  },
  {
    "folke/zen-mode.nvim",
  },
  --   {
  --     "epwalsh/obsidian.nvim",
  --     config = function()
  --       require("obsidian").setup({
  --   dir = "~/my-vault",
  --   completion = {
  --     nvim_cmp = true, -- if using nvim-cmp, otherwise set to false
  --   }
  -- })
  --     end,
  --   },
  {
    "nvim-neorg/neorg",
    event = "VeryLazy",
    dependencies = { { "nvim-lua/plenary.nvim" } },
    config = function()
      require('neorg').setup {
        load = {
              ["core.defaults"] = {}, -- Loads default behaviour
              ["core.norg.concealer"] = {
            config = {
              icon_preset = "diamond",
              folds = false,
            },
          }, -- Adds pretty icons to your documents
              ["core.norg.completion"] = {
            config = {
              engine = "nvim-cmp",
            },
          }, -- Autocomplete
              ["core.presenter"] = {
            config = {
              zen_mode = "zen-mode"

            },
          },
              ["core.export"] = {
            config = {
              export_dir = "<export-dir>/<language>-export",
            }
          },
              ["core.export.markdown"] = {
            config = {
              -- extensions = "",
              -- mathematics = "",
              -- metadata = "",
              -- next one is not a duplicate or a typo
              extension = "md",
            }
          },
              ["core.norg.journal"] = {
            config = {
              strategy =
              "%Y-%#m-%#d.norg"
            }
          },
              ["core.norg.dirman"] = { -- Manages Neorg workspaces
            config = {
              workspaces = {
                notes = "~/notes",
              },
            },
          },
        },
      }
    end,
    build = ":Neorg sync-parsers",
  },

}
