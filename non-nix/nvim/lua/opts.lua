-- highlight on search but remove on esc
vim.opt.hlsearch = true
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- indenting config
vim.o.expandtab = true
vim.o.smartindent = true
vim.o.tabstop = 2
vim.o.shiftwidth = 2
-- vim.o.tabstop = 4
-- vim.o.shiftwidth = 4

-- floating window borders
vim.o.winborder = "rounded"

-- whitespace character display
vim.opt.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

-- lines
vim.opt.number = true
vim.opt.relativenumber = true
-- vim.opt.linespace =

-- don't show mode since it's already in lualine
vim.opt.showmode = false

-- minimum number of lines above and below the cursor
vim.opt.scrolloff = 15

-- Always show the tabline
-- vim.o.showtabline = 2

-- ### KEYMAPS
vim.keymap.set("n", "q:", "<Nop>")

-- navigation
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Move focus to the down window" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Move focus to the up window" })

vim.keymap.set("n", "<esc><esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

vim.keymap.set("n", "<C-w>t", ":$tabnew<CR>", { noremap = true }) -- New tab

-- Centred scroll binds
vim.keymap.set("n", "<C-d>", "<C-d>zz", { noremap = true, silent = true })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { noremap = true, silent = true })
vim.o.scroll = 10

-- for folke/edgy
vim.opt.laststatus = 3
vim.opt.splitkeep = "screen"

-- for obsidian.nvim
vim.opt.conceallevel = 1
