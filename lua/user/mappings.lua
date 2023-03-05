vim.g.maplocalleader = ','


lvim.builtin.which_key.mappings["t"] = {
  name = "Diagnos/Git",
  t = { 
    name= "Trouble",
    t = {"<cmd>TroubleToggle<cr>", "trouble"},
    w = { "<cmd>TroubleToggle workspace_diagnostics<cr>", "workspace" },
    d = { "<cmd>TroubleToggle document_diagnostics<cr>", "document" },
    q = { "<cmd>TroubleToggle quickfix<cr>", "quickfix" },
    l = { "<cmd>TroubleToggle loclist<cr>", "loclist" },
    r = { "<cmd>TroubleToggle lsp_references<cr>", "references" },
  },

  g = {
    name = "Git",
    g = { "<cmd>lua require 'lvim.core.terminal'.lazygit_toggle()<cr>", "Lazygit" },
    j = { "<cmd>lua require 'gitsigns'.next_hunk({navigation_message = false})<cr>", "Next Hunk" },
    k = { "<cmd>lua require 'gitsigns'.prev_hunk({navigation_message = false})<cr>", "Prev Hunk" },
    l = { "<cmd>lua require 'gitsigns'.blame_line()<cr>", "Blame" },
    p = { "<cmd>lua require 'gitsigns'.preview_hunk()<cr>", "Preview Hunk" },
    r = { "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", "Reset Hunk" },
    R = { "<cmd>lua require 'gitsigns'.reset_buffer()<cr>", "Reset Buffer" },
    s = { "<cmd>lua require 'gitsigns'.stage_hunk()<cr>", "Stage Hunk" },
    u = {
      "<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>",
      "Undo Stage Hunk",
    },
    o = { "<cmd>Telescope git_status<cr>", "Open changed file" },
    b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
    c = { "<cmd>Telescope git_commits<cr>", "Checkout commit" },
    C = {
      "<cmd>Telescope git_bcommits<cr>",
      "Checkout commit(for current file)",
    },
    d = {
      "<cmd>Gitsigns diffthis HEAD<cr>",
      "Git Diff",
    },
  },
  
  h = { "<Esc><cmd>ToggleTerm dir=git_dir direction=horizontal<CR>", "Toggle H. Term" },
  v = { "<Esc><cmd>ToggleTerm dir=git_dir direction=vertical<CR>", "Toggle V. Term" },

  
}



lvim.builtin.which_key.mappings["c"] = {
  name = "Custom",

  d = {"<Esc><cmd>lua require('utils.terminal').discord()<CR>", "Discord"},

  c = {"<cmd>nohlsearch<CR>", "Clear highlight"},

  t = {
    name = "Table Mode",
    t = {"<cmd>TableModeToggle<CR>", "Table mode toggle"},
    a = {"<cmd>TableModeRealign<CR>","Align items"},
    c = {"<cmd>Tableize<CR>", "Table from selection"},
  },

  s = {
    name = "Sessions",
    l = {":Telescope possession list<CR>",
      "List"
    },
  
    n = {
      function()
        vim.ui.input({
          prompt = "Save session: ",
          default = "session",

        }, function(input)
          if input then
            vim.cmd('SSave ' .. input)
          else
            print "You cancelled"
          end
        end)
      end,
      "New"
    },
  
  
  
  }
}

lvim.builtin.which_key.mappings["h"] = {
  name = "Helpers",
  -- i = { "<cmd>lua require('utils.terminal').interactive_cheatsheet_toggle()<CR>", "Interactive Cheatsheet" },


  h = {
    name = "HowTo",
    c = { "<cmd>lua require('utils.terminal').cht()<CR>", "Cheatsheet" },
    s = { [[ <Esc><Cmd>lua require('utils.terminal').so()<CR>]], "Stack Overflow" },


  },


  d = {
    name = "Debug",
        t = { "<cmd>lua require'dap'.toggle_breakpoint()<cr>", "Toggle Breakpoint" },
        b = { "<cmd>lua require'dap'.step_back()<cr>", "Step Back" },
        c = { "<cmd>lua require'dap'.continue()<cr>", "Continue" },
        C = { "<cmd>lua require'dap'.run_to_cursor()<cr>", "Run To Cursor" },
        d = { "<cmd>lua require'dap'.disconnect()<cr>", "Disconnect" },
        g = { "<cmd>lua require'dap'.session()<cr>", "Get Session" },
        i = { "<cmd>lua require'dap'.step_into()<cr>", "Step Into" },
        o = { "<cmd>lua require'dap'.step_over()<cr>", "Step Over" },
        u = { "<cmd>lua require'dap'.step_out()<cr>", "Step Out" },
        p = { "<cmd>lua require'dap'.pause()<cr>", "Pause" },
        r = { "<cmd>lua require'dap'.repl.toggle()<cr>", "Toggle Repl" },
        s = { "<cmd>lua require'dap'.continue()<cr>", "Start" },
        q = { "<cmd>lua require'dap'.close()<cr>", "Quit" },
        U = { "<cmd>lua require'dapui'.toggle({reset = true})<cr>", "Toggle UI" },
  },



}



lvim.builtin.which_key.mappings["g"] = {

}