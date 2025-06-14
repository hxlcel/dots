return {
  -- TODO: configure. also buferline maybe?
  "nvim-lualine/lualine.nvim",
  lazy = false,
  dependencies = { "nvim-tree/nvim-web-devicons" },

  -- TODO: folke/Trouble statusline (doing something wrong)
  -- opts = function(_, opts)
  --   local trouble = require("trouble")
  --   local symbols = trouble.statusline({
  --     mode = "lsp_document_symbols",
  --     groups = {},
  --     title = false,
  --     filter = { range = true },
  --     format = "{kind_icon}{symbol.name:Normal}",
  --     -- The following line is needed to fix the background color
  --     -- Set it to the lualine section you want to use
  --     hl_group = "lualine_c_normal",
  --   })
  --   table.insert(opts.sections.lualine_c, {
  --     symbols.get,
  --     cond = symbols.has,
  --   })
  -- end,

  config = function()
    -- Eviline config for lualine
    -- Author: shadmansaleh
    -- Credit: glepnir
    local lualine = require("lualine")

    -- Color table for highlights
    -- stylua: ignore
    local colors = {

      -- TODO: theme colors

      -- bg       = '#202328',
      -- bg       = "#232136",
      fg       = '#bbc2cf',
      -- yellow   = 'iECBE7B',
      -- cyan     = '#008080',
      -- darkblue = '#081633',
      green    = '#98be65',
      orange   = '#FF8800',
      -- violet   = '#a9a1e1',
      -- magenta  = '#c678dd',
      -- blue     = '#51afef',
      -- red      = '#ec5f67',

      -- rosepine (kinda sorta)
      bg       = "#232136",
      -- fg       = ,
      yellow   = "#f6c177",
      cyan     = "#9ccfd8",
      darkblue = "#393552",
      -- green    = ,
      -- orange   = ,
      violet   = "#c4a7e7",
      magenta  = "#ea9a97",
      blue     = "#3e8fb0",
      red      = "#eb6f92",
    }

    local conditions = {
      buffer_not_empty = function()
        return vim.fn.empty(vim.fn.expand("%:t")) ~= 1
      end,
      hide_in_width = function()
        return vim.fn.winwidth(0) > 80
      end,
      check_git_workspace = function()
        local filepath = vim.fn.expand("%:p:h")
        local gitdir = vim.fn.finddir(".git", filepath .. ";")
        return gitdir and #gitdir > 0 and #gitdir < #filepath
      end,
    }

    -- Config
    local config = {
      options = {
        -- Disable sections and component separators
        component_separators = "",
        section_separators = "",
        theme = {
          -- We are going to use lualine_c an lualine_x as left and
          -- right section. Both are highlighted by c theme .  So we
          -- are just setting default looks o statusline
          normal = { c = { fg = colors.fg, bg = colors.bg } },
          inactive = { c = { fg = colors.fg, bg = colors.bg } },
        },
      },
      sections = {
        -- these are to remove the defaults
        lualine_a = {},
        lualine_b = {},
        lualine_y = {},
        lualine_z = {},
        -- These will be filled later
        lualine_c = {},
        lualine_x = {},
      },
      inactive_sections = {
        -- these are to remove the defaults
        lualine_a = {},
        lualine_b = {},
        lualine_y = {},
        lualine_z = {},
        lualine_c = {},
        lualine_x = {},
      },

      -- winbar = {},
    }

    -- Inserts a component in lualine_c at left section
    local function ins_left(component)
      table.insert(config.sections.lualine_c, component)
    end

    -- Inserts a component in lualine_x at right section
    local function ins_right(component)
      table.insert(config.sections.lualine_x, component)
    end

    -- ins_left({
    --   function()
    --     -- return "▊"
    --     return ""
    --   end,
    --   color = { fg = colors.blue }, -- Sets highlighting of component
    --   padding = { left = 0, right = 1 }, -- We don't need space before this
    -- })

    ins_left({
      -- mode component
      function()
        return ""
      end,
      color = function()
        -- auto change color according to neovims mode
        local mode_color = {
          n = colors.red,
          i = colors.green,
          v = colors.blue,
          [""] = colors.blue,
          V = colors.blue,
          c = colors.magenta,
          no = colors.red,
          s = colors.orange,
          S = colors.orange,
          [""] = colors.orange,
          ic = colors.yellow,
          R = colors.violet,
          Rv = colors.violet,
          cv = colors.red,
          ce = colors.red,
          r = colors.cyan,
          rm = colors.cyan,
          ["r?"] = colors.cyan,
          ["!"] = colors.red,
          t = colors.red,
        }
        return { fg = mode_color[vim.fn.mode()] }
      end,
      padding = { left = 1, right = 1 },
    })

    -- ins_left({ "mode" })

    ins_left({
      -- filesize component
      "filesize",
      cond = conditions.buffer_not_empty,
    })

    -- ins_left({
    --   "filename",
    --   cond = conditions.buffer_not_empty,
    --   -- color = { fg = colors.magenta, gui = "bold" },
    --   color = { fg = colors.magenta },
    -- })

    -- ins_left({ "location" })

    -- ins_left({ "progress", color = { fg = colors.fg, gui = "bold" } })
    -- ins_left({ "progress", color = { fg = colors.fg } })

    ins_left({
      "diagnostics",
      sources = { "nvim_diagnostic" },
      symbols = { error = " ", warn = " ", info = " " },
      diagnostics_color = {
        error = { fg = colors.red },
        warn = { fg = colors.yellow },
        info = { fg = colors.cyan },
      },
    })

    -- Insert mid section. You can make any number of sections in neovim :)
    -- for lualine it's any number greater then 2
    -- ins_left({
    --   function()
    --     return "%="
    --   end,
    -- })

    ins_left({
      -- Lsp server name .
      function()
        local msg = "No Active Lsp"
        local buf_ft = vim.api.nvim_get_option_value("filetype", { buf = 0 })
        local clients = vim.lsp.get_clients()
        if next(clients) == nil then
          return msg
        end
        for _, client in ipairs(clients) do
          local filetypes = client.config.filetypes
          if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
            return client.name
          end
        end
        return msg
      end,
      icon = "  LSP:",
      -- color = { fg = "#ffffff", gui = "bold" },
      color = { fg = "#ffffff" },
    })

    -- Add components to right sections
    ins_right({
      "o:encoding", -- option component same as &encoding in viml
      fmt = string.upper, -- I'm not sure why it's upper case either ;)
      cond = conditions.hide_in_width,
      -- color = { fg = colors.green, gui = "bold" },
      color = { fg = colors.green },
    })

    ins_right({
      "fileformat",
      fmt = string.upper,
      icons_enabled = false, -- I think icons are cool but Eviline doesn't have them. sigh
      -- color = { fg = colors.green, gui = "bold" },
      color = { fg = colors.green },
    })

    ins_right({
      "branch",
      icon = "",
      -- color = { fg = colors.violet, gui = "bold" },
      color = { fg = colors.violet },
    })

    ins_right({
      "diff",
      -- Is it me or the symbol for modified us really weird
      symbols = { added = " ", modified = "󰝤 ", removed = " " },
      diff_color = {
        added = { fg = colors.green },
        modified = { fg = colors.orange },
        removed = { fg = colors.red },
      },
      cond = conditions.hide_in_width,
    })

    -- ins_right({
    --   function()
    --     -- return "▊"
    --     return ""
    --   end,
    --   color = { fg = colors.blue },
    --   padding = { left = 1 },
    -- })

    -- Now don't forget to initialize lualine
    lualine.setup(config)
  end,
}
