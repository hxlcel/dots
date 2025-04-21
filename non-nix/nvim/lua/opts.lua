-- highlight on search but remove on esc
vim.opt.hlsearch = true
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- indenting config
vim.o.expandtab = true
vim.o.smartindent = true
vim.o.tabstop = 2
vim.o.shiftwidth = 2

-- floating window borders
vim.o.winborder = 'rounded'

-- whitespace character display
vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- don't show mode since it's already in lualine
vim.opt.showmode = false

-- minimum number of lines above and below the cursor
vim.opt.scrolloff = 15

-- navigation keymaps
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Move focus to the down window" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Move focus to the up window" })

