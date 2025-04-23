return {
  "echasnovski/mini.nvim",
  version = false,
  config = function()

    require("mini.surround").setup()

    require("mini.files").setup()
    require('mini.files').setup()

  end,

  keys = {
    { "<leader>e", function() MiniFiles.open() end, desc = "Minifiles"}
  }
}
