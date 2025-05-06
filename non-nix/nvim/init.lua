-- TODO: whole config extremely disorganised. Many things are unused. Needs major cleanup.
--
--TODO: floaterm??, python running
-- set leader
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
require("opts")
require("diagnostic-opts")

require("config.lazy")
-- require("nvim-tree").setup()
-- require("transparent").setup()

-- add relative and absolute line numbers
vim.wo.number = true
vim.wo.relativenumber = true

-- indent settings
vim.opt.tabstop = 2
vim.opt.smartindent = true
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

-- Centred scroll binds
vim.keymap.set("n", "<C-d>", "<C-d>zz", { noremap = true, silent = true })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { noremap = true, silent = true })
vim.o.scroll = 10

-- Python
vim.g.python3_host_prog = "/run/current-system/sw/bin/python3"

function Get_env_python()
  return vim.fn.trim(vim.fn.system("which python3"))
end

print("Project Environment Python path:", Get_env_python())
