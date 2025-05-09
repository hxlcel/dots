return {
  "echasnovski/mini.nvim",
  event = "vimEnter",
  version = false,

  config = function()
    local surround = require("mini.surround")
    local files = require("mini.files")
    local pairs = require("mini.pairs")
    local keymap = require("mini.keymap")
    local hipatterns = require("mini.hipatterns")
    local sessions = require("mini.sessions")
    local move = require("mini.move")
    local icons = require("mini.icons")

    -- ### Initialise the plugins ###
    surround.setup()
    files.setup()
    pairs.setup()
    keymap.setup()
    hipatterns.setup()
    sessions.setup()
    move.setup()
    icons.setup()

    -- ### Configuration ###
    surround.setup = {}

    files.setup = {}

    pairs.setup = {}

    sessions.setup = {}

    hipatterns.setup = {
      highlighters = {
        hex_color = hipatterns.gen_highlighter.hex_color(),
      },
    }

    move.setup = {}

    local tab_steps = {
      -- "blink_next",
      "jump_after_tsnode",
      "jump_after_close",
    }
    local shifttab_steps = {
      -- "blink_prev",
      "jump_before_tsnode",
      "jump_before_open",
    }
    keymap.setup = {
      keymap.map_multistep("i", "<Tab>", tab_steps),
      keymap.map_multistep("i", "<S-Tab>", shifttab_steps),
      -- keymap.map_multistep("i", "<CR>", { "blink_accept", "minipairs_cr" }),
      keymap.map_multistep("i", "<BS>", { "minipairs_bs" }),
    }
  end,

  -- stylua: ignore

  -- ### Keybinds ###
  keys = {
    { "<leader>f", function() MiniFiles.open() end, desc = "Mini.[f]iles"},
  },
}
