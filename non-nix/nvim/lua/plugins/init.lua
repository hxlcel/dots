return {
  -- #TODO: create a list which sets which plugins to install
  -- rather than importing the whole contents of the plugins file
  { "nvim-lua/plenary.nvim" },
  { "j-hui/fidget.nvim" },
  -- { "utilyre/barbecue.nvim" } -- Breadcrumbs like vscode
  {
    "christoomey/vim-tmux-navigator",
    lazy = false,
  },
}
