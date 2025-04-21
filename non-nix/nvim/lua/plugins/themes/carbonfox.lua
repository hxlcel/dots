return {
  "EdenEast/nightfox.nvim",
  enabled = false,
  config = function ()
    require("carbonfox").setup({
      options = {
        transparent = true,
      },
    })
  vim.cmd("colorscheme carbonfox")
end
}
