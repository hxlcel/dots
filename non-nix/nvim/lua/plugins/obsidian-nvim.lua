-- TODO: some strange behaviours, particularly with checkboxes
return {
  {
    "obsidian-nvim/obsidian.nvim",
    version = "*", -- recommended, use latest release instead of latest commit
    lazy = true,
    ft = "markdown",
    -- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
    -- event = {
    --   -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
    --   -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/*.md"
    --   -- refer to `:h file-pattern` for more examples
    --   "BufReadPre path/to/my-vault/*.md",
    --   "BufNewFile path/to/my-vault/*.md",
    -- },
    dependencies = {
      -- Required.
      "nvim-lua/plenary.nvim",
      -- Added Optional dependencies.
      "folke/snacks.nvim",
      "OXY2DEV/markview.nvim", -- Gonna try this in place of render-markdown, see if it's even better
    },
    ---@module "obsidian"
    opts = {
      workspaces = {
        {
          name = "BeinnTharsuinn",
          path = "~/Documents/BeinnTharsuinn/",
        },
      },
      completion = {
        blink = true,
        min_chars = 2,
      },

      picker = {
        name = "snacks.pick",
      },

      notes_subdir = "New Notes",
      new_notes_location = "notes_subdir",

      preferred_link_style = "wiki",

      templates = {
        folder = "Utilities/Templates",
      },

      -- Using render-markdown for this
      -- ui = {
      --   enable = true,
      --   checkboxes = {
      --     [" "] = { char = "󰄱", hl_group = "ObsidianTodo" },
      --     ["x"] = { char = "", hl_group = "ObsidianDone" },
      --     [">"] = { char = "", hl_group = "ObsidianRightArrow" },
      --     ["~"] = { char = "󰰱", hl_group = "ObsidianTilde" },
      --     ["!"] = { char = "", hl_group = "ObsidianImportant" },
      --   },
      --
      --   bullets = { char = "•", hl_group = "ObsidianBullet" },
      --   external_link_icon = { char = "", hl_group = "ObsidianExtLinkIcon" },
      --
      --   reference_text = { hl_group = "ObsidianRefText" },
      --   highlight_text = { hl_group = "ObsidianHighlightText" },
      --   tags = { hl_group = "ObsidianTag" },
      --   block_ids = { hl_group = "ObsidianBlockID" },
      --   hl_groups = {
      --     ObsidianTodo = { bold = true, fg = "#f78c6c" },
      --     ObsidianDone = { bold = true, fg = "#89ddff" },
      --     ObsidianRightArrow = { bold = true, fg = "#f78c6c" },
      --     ObsidianTilde = { bold = true, fg = "#ff5370" },
      --     ObsidianImportant = { bold = true, fg = "#d73128" },
      --     ObsidianBullet = { bold = true, fg = "#89ddff" },
      --     ObsidianRefText = { underline = true, fg = "#c792ea" },
      --     ObsidianExtLinkIcon = { fg = "#c792ea" },
      --     ObsidianTag = { italic = true, fg = "#89ddff" },
      --     ObsidianBlockID = { italic = true, fg = "#89ddff" },
      --     ObsidianHighlightText = { bg = "#75662e" },
      --   },
      -- },
    },
  },
  {
    "OXY2DEV/markview.nvim",
    -- TODO: many interesting details, look into some! https://github.com/OXY2DEV/markview.nvim?tab=readme-ov-file
    -- including extra modules for cool features.
    lazy = false, -- ALWAYS FALSE; uses it's own lazy loading.
    dependencies = {
      "saghen/blink.cmp", -- for blink completion
    },
  },
}
