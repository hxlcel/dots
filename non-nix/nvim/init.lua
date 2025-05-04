-- TODO: whole config extremely disorganised. Many things are unused. Needs major cleanup.
-- set leader
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
require("opts")
require("diagnostic-opts")

require("config.lazy")
require("lualine").setup()
-- require("nvim-tree").setup()
-- require("transparent").setup()

-- add relative and absolute line numbers
vim.wo.number = true
vim.wo.relativenumber = true

-- vim.api.nvim_set_keymap("n", "<leader>f", "<cmd>NvimTreeToggle<CR>", {noremap = true, silent = true})

-- indent settings
vim.opt.tabstop = 2
vim.opt.smartindent = true
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

-- Centred scroll binds
vim.keymap.set("n", "<C-d>", "<C-d>zz", { noremap = true, silent = true })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { noremap = true, silent = true })
vim.o.scroll = 10
