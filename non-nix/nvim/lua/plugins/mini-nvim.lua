return {
  "echasnovski/mini.nvim",
  version = false,
  config = function()

    require("mini.surround").setup()
    require("mini.files").setup()

  end,

  keys = {
    { "<leader>f", function() MiniFiles.open() end, desc = "Minifiles"}
  }
}
