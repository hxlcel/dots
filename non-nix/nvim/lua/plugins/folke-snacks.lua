return {
  "folke/snacks.nvim",
  lazy = false,
  priority = 1000,
  ---@type snacks.config
  opts = {

    -- Snacks.nvim modules
    picker = {
      -- Floating Explorer by drowning-cat on github: https://github.com/folke/snacks.nvim/discussions/1306
      sources = {
        explorer = {
          actions = {
            bufadd = function(_, item)
              if vim.fn.bufexists(item.file) == 0 then
                local buf = vim.api.nvim_create_buf(true, false)
                vim.api.nvim_buf_set_name(buf, item.file)
                vim.api.nvim_buf_call(buf, vim.cmd.edit)
              end
            end,
            confirm_nofocus = function(picker, item)
              if item.dir then
                picker:action("confirm")
              else
                picker:action("bufadd")
              end
            end,
          },
          win = {
            list = {
              keys = {
                ["l"] = "confirm_nofocus",
                ["L"] = "confirm",
              },
            },
          },
          auto_close = true,
          layout = {
            cycle = true,
            preview = true, ---@diagnostic disable-line: assign-type-mismatch
            layout = {
              box = "horizontal",
              position = "float",
              height = 0.95,
              width = 0,
              border = "rounded",
              {
                box = "vertical",
                width = 40,
                min_width = 40,
                { win = "input", height = 1, title = "{title} {live} {flags}", border = "single" },
                { win = "list" },
              },
              { win = "preview", width = 0, border = "left" },
            },
          },
        },
      },
    },

    explorer = {}, -- TODO: floating explorer from github

    terminal = {},

    -- statuscolumn = {
    --   ---@class snacks.statuscolumn.Config
    --   ---@field left snacks.statuscolumn.Components
    --   ---@field right snacks.statuscolumn.Components
    --   ---@field enabled? boolean
    --   {
    --     left = { "mark", "sign" }, -- priority of signs on the left (high to low)
    --     right = { "fold", "git" }, -- priority of signs on the right (high to low)
    --     folds = {
    --       open = false, -- show open fold icons
    --       git_hl = false, -- use Git Signs hl for fold icons
    --     },
    --     git = {
    --       -- patterns to match Git signs
    --       patterns = { "GitSign", "MiniDiffSign" },
    --     },
    --     refresh = 50, -- refresh at most every 50ms
    --   },
    -- },

    -- dim = {
    --   enabled = true,
    -- },

    notifier = {
      enabled = true,
      timeout = 9000.,
    },

    lazygit = {
      enabled = true,
      ---@class snacks.lazygit.Config: snacks.terminal.Opts
      ---@field args? string[]
      ---@field theme? snacks.lazygit.Theme
      {
        -- automatically configure lazygit to use the current colorscheme
        -- and integrate edit with the current neovim instance
        configure = true,
        -- extra configuration for lazygit that will be merged with the default
        -- snacks does NOT have a full yaml parser, so if you need `"test"` to appear with the quotes
        -- you need to double quote it: `"\"test\""`
        config = {
          os = { editPreset = "nvim-remote" },
          gui = {
            -- set to an empty string "" to disable icons
            nerdFontsVersion = "3",
          },
        },
        win = {
          style = "lazygit",
        },
      },
    },

    dashboard = { ------------------------------------------------------------------------------------------------
      -- enabled = false,
      width = 18,
      preset = {
        --stylua: ignore start
        keys = {
          { icon = "", key = "f", desc = " ̲find file", action = ":lua Snacks.dashboard.pick('files')" },
          { icon = "", key = "n", desc = " ̲new file", action = ":ene | startinsert" },
          { icon = "", key = "g", desc = " ̲grep text", action = ":lua Snacks.dashboard.pick('live_grep')" },
          { icon = "", key = "r", desc = " ̲recent file", action = ":lua Snacks.dashboard.pick('oldfiles')" },
          { icon = "", key = "c", desc = " ̲config", action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})" },
          { icon = "", key = "s", desc = " ̲session", section = "session" },
          { icon = "", key = "L", desc = " ̲Lazy", action = ":Lazy", enabled = package.loaded.lazy ~= nil },
          { icon = "", key = "q", desc = " ̲quit", action = ":qa" },
        },
        -- stylua: ignore end
        header = [[
      ████ ██████           █████      ██                    
     ███████████             █████                            
     █████████ ███████████████████ ███   ███████████  
    █████████  ███    █████████████ █████ ██████████████  
   █████████ ██████████ █████████ █████ █████ ████ █████  
 ███████████ ███    ███ █████████ █████ █████ ████ █████ 
██████  █████████████████████ ████ █████ █████ ████ ██████
        ]],
      },
      formats = {
        key = { "" },
      },
    }, --------------------------------------------------------------------------------------------------------
  },


  -- stylua: ignore start
  keys = {

    -- ###---- Picker & Explorer ----###

    -- ### Explorer & Common Pickers
    { "<leader><space>", function() Snacks.picker.smart() end, desc = "Smart Find Files" },
    { "<leader>,", function() Snacks.picker.buffers() end, desc = "Buffers" },
    { "<leader>/", function() Snacks.picker.grep() end, desc = "Grep" },
    { "<leader>:", function() Snacks.picker.command_history() end, desc = "Command History" },
    { "<leader>n", function() Snacks.picker.notifications() end, desc = "Notification History" },
    { "<leader>e", function() Snacks.explorer() end, desc = "[e]xplorer" },

    -- ### [F]ind
    { "<leader>Fb", function() Snacks.picker.buffers() end, desc = "Buffers" },
    { "<leader>Fc", function() Snacks.picker.files({ cwd = vim.fn.stdpath("config") }) end, desc = "Find Config File" },
    { "<leader>Ff", function() Snacks.picker.files() end, desc = "Find Files" },
    { "<leader>Fg", function() Snacks.picker.git_files() end, desc = "Find Git Files" },
    { "<leader>Fp", function() Snacks.picker.projects() end, desc = "Projects" },
    { "<leader>Fr", function() Snacks.picker.recent() end, desc = "Recent" },

    -- ### [g]it
    { "<leader>gb", function() Snacks.picker.git_branches() end, desc = "Git Branches" },
    { "<leader>gl", function() Snacks.picker.git_log() end, desc = "Git Log" },
    { "<leader>gL", function() Snacks.picker.git_log_line() end, desc = "Git Log Line" },
    { "<leader>gs", function() Snacks.picker.git_status() end, desc = "Git Status" },
    { "<leader>gS", function() Snacks.picker.git_stash() end, desc = "Git Stash" },
    { "<leader>gd", function() Snacks.picker.git_diff() end, desc = "Git Diff (Hunks)" },
    { "<leader>gf", function() Snacks.picker.git_log_file() end, desc = "Git Log File" },

    -- ### [S]earch
    -- ### neovim
    { '<leader>S"', function() Snacks.picker.registers() end, desc = "Registers" },
    { '<leader>S/', function() Snacks.picker.search_history() end, desc = "Search History" },
    { "<leader>Sa", function() Snacks.picker.autocmds() end, desc = "Autocmds" },
    { "<leader>Sb", function() Snacks.picker.lines() end, desc = "Buffer Lines" },
    { "<leader>Sc", function() Snacks.picker.command_history() end, desc = "Command History" },
    { "<leader>SC", function() Snacks.picker.commands() end, desc = "Commands" },
    { "<leader>Sd", function() Snacks.picker.diagnostics() end, desc = "Diagnostics" },
    { "<leader>SD", function() Snacks.picker.diagnostics_buffer() end, desc = "Buffer Diagnostics" },
    { "<leader>Sh", function() Snacks.picker.help() end, desc = "Help Pages" },
    { "<leader>SH", function() Snacks.picker.highlights() end, desc = "Highlights" },
    { "<leader>Si", function() Snacks.picker.icons() end, desc = "Icons" },
    { "<leader>Sj", function() Snacks.picker.jumps() end, desc = "Jumps" },
    { "<leader>Sk", function() Snacks.picker.keymaps() end, desc = "Keymaps" },
    { "<leader>Sl", function() Snacks.picker.loclist() end, desc = "Location List" },
    { "<leader>Sm", function() Snacks.picker.marks() end, desc = "Marks" },
    { "<leader>SM", function() Snacks.picker.man() end, desc = "Man Pages" },
    { "<leader>Sp", function() Snacks.picker.lazy() end, desc = "Search for Plugin Spec" },
    { "<leader>Sq", function() Snacks.picker.qflist() end, desc = "Quickfix List" },
    { "<leader>SR", function() Snacks.picker.resume() end, desc = "Resume" },
    { "<leader>Su", function() Snacks.picker.undo() end, desc = "Undo History" },
    { "<leader>Sc", function() Snacks.picker.colorschemes() end, desc = "Colorschemes" },
    -- ### [g]rep
    { "<leader>Sgb", function() Snacks.picker.lines() end, desc = "Buffer Lines" },
    { "<leader>SgB", function() Snacks.picker.grep_buffers() end, desc = "Grep Open Buffers" },
    { "<leader>Sgg", function() Snacks.picker.grep() end, desc = "Grep" },
    { "<leader>Sgw", function() Snacks.picker.grep_word() end, desc = "Visual selection or word", mode = { "n", "x" } },

    -- ### [L]SP
    { "<leader>ld", function() Snacks.picker.lsp_definitions() end, desc = "Goto Definition" },
    { "<leader>lD", function() Snacks.picker.lsp_declarations() end, desc = "Goto Declaration" },
    { "<leader>lr", function() Snacks.picker.lsp_references() end, nowait = true, desc = "References" },
    { "<leader>lI", function() Snacks.picker.lsp_implementations() end, desc = "Goto Implementation" },
    { "<leader>ly", function() Snacks.picker.lsp_type_definitions() end, desc = "Goto T[y]pe Definition" },
    { "<leader>ls", function() Snacks.picker.lsp_symbols() end, desc = "LSP Symbols" },
    { "<leader>lS", function() Snacks.picker.lsp_workspace_symbols() end, desc = "LSP Workspace Symbols" },

    -- ###---- Other ----###
    { "<leader>G", function() Snacks.lazygit() end, desc = "Lazy[G]it" },
    { "<leader>T", function() Snacks.terminal.toggle() end, desc = "Terminal" },
  },
  -- stylua: ignore end
}
