return {
  "echasnovski/mini.nvim",
  event = "vimEnter",
  version = false,

  config = function()

    -- ### Define locals ###
    local surround = require("mini.surround")
    local files = require("mini.files")
    local pairs = require("mini.pairs")

    -- ### Initialise the plugins ###
    surround.setup()
    files.setup()
    pairs.setup()

    -- ### Configuration ###
    surround.setup = ({})

    files.setup = ({})

    pairs.setup = ({})

  end,

  keys = {
    { "<leader>e", function() MiniFiles.open() end, desc = "Minifiles"},
  }
}
