-- return{
--   "leath-dub/snipe.nvim",
--   lazy = false,
--   config = function ()
--     local snipe = require("snipe")
--
--     snipe.setup({
--       hints = {
--         dictionary = "asfghl;wertyuiop",
--       },
--       navigate = {
--         cancel_snipe = "q",
--         close_buffer = "d",
--       },
--     })
--
--   end,
--   keys ={
--     {
--       "<leader>d",
--       function()
--         require("snipe.buffer").get_buffers()
--       end
--     }
--   }
-- }

return {
  "leath-dub/snipe.nvim",

  keys = {
    {"<leader>S", function () require("snipe").open_buffer_menu() end, desc = "Open Snipe buffer menu"}
  },

  opts = {

    hints = {
      dictionary = "asfghl;wertyuiop",
    },

    navigate = {
      cancel_snipe = "q",
      close_buffer = "d",
    },

  }
}
