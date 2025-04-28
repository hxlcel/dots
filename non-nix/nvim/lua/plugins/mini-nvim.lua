return {
  "echasnovski/mini.nvim",
  event = "vimEnter",
  version = false,
  config = function()

    -- Define locals
    local surround = require("mini.surround")
    local files = require("mini.files")
    -- local starter = require("mini.starter")

    -- Initialise the plugins
    surround.setup()
    files.setup()
    -- starter.setup()

    -- Configuration
    surround.setup = ({})

    files.setup = ({})

    -- starter.setup({
    --   items = {
    --     starter.sections.telescope(),
    --   },
    --   content_hooks = {
    --     starter.gen_hook.adding_bullet(),
    --     starter.gen_hook.aligning('center', 'center'),
    --   },
    -- })
  end,

  keys = {
    { "<leader>e", function() MiniFiles.open() end, desc = "Minifiles"},
  }
}
