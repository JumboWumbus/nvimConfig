local alpha = require("alpha")
local dashboard = require("alpha.themes.dashboard")
local terminal = require("alpha.term")
local banners = require("user.config.banners")

dashboard.section.buttons.val = {
  dashboard.button("f", "  Find a file", "<CMD>Telescope find_files<CR>"),
  dashboard.button("e", "  New file", "<CMD>ene!<CR>"),
  dashboard.button("p", "  Find a project", "<CMD>Telescope projects<CR>"),
  dashboard.button("r", "  Recently used files", "<CMD>Telescope oldfiles <CR>"),
  dashboard.button("t", "  Find text", "<CMD>Telescope live_grep<CR>"),
  dashboard.button("c", "  Configuration", "<CMD>edit " .. require("lvim.config"):get_user_config_path() .. " <CR>"),
  dashboard.button("q", "  Quit Neovim", "<CMD>quit<CR>"),
}

dashboard.section.buttons.opts = {
  hl = "Keyword",
  hl_shortcut = "Include",
  spacing = 1,
}




dashboard.section.date = {
  type = "text",
  val = function()
    local date = os.date "%a %d %b"
    local plugins_text = 
    "┏━ " .. "" .. " Today is " .. date .. " ━┓"

    return plugins_text .. "\n"
  end,

  opts={
    hl = "YellowBold",
    position = "center",
  }
}


dashboard.section.version = {
  type = "text",
  val = function()
    local text = 
    "┗━━━━━━━  " .. " " .. vim.version().major .. "." .. vim.version().minor .. "." .. vim.version().patch .. "  ━━━━━━━┛"

    return text
  end,

  opts={
    hl = "YellowBold",
    position = "center",
  }
}






-- Quote 

local fortune = require "alpha.fortune"()
dashboard.section.quote = {
  type = "text",
  val = fortune,

  opts = {
    position = "center",
    hl = "Comment",
    hl_shortcut = "Comment",
  },
}


-- Banner

local bigRand = math.random(#banners.banner_large)
local smallRand = math.random(#banners.banner_small)
dashboard.section.header = {
  
  type = "text",

  val = function()
    local alpha_wins = vim.tbl_filter(function(win)
      local buf = vim.api.nvim_win_get_buf(win)
      return vim.api.nvim_buf_get_option(buf, "filetype") == "alpha"
    end, vim.api.nvim_list_wins())

    if vim.api.nvim_win_get_height(alpha_wins[#alpha_wins]) < 36 then
      return banners.banner_small[smallRand]
    end
    return banners.banner_large[bigRand]
  end,

  opts = {
    position = "center",
    hl = "Constant",
  }
}

dashboard.config.layout = {
{ type = "padding", val = 4 },
dashboard.section.header,
{ type = "padding", val = 1 },
dashboard.section.date,
dashboard.section.version,
{ type = "padding", val = 2 },
dashboard.section.buttons,
{ type = "padding", val = 1 },
dashboard.section.quote,
}

alpha.setup(dashboard.opts)