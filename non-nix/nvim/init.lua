-- TODO: whole config extremely disorganised. Many things are unused. Needs major cleanup.
--
--TODO: floaterm??, python running

-- ###---- Set Leader Key ----###
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- ###---- Imports ----###
require("opts")
require("diagnostic-opts")

require("config.lazy")

-- ###---- Python Interpreter Path ----###
vim.g.python3_host_prog = "/run/current-system/sw/bin/python3"
-- Use systemwide python environment; helpers.get_python_path() for the environment interpreter.

-- ###---- Examples ----###
-- Example of configuring nvim term & issuing commands remotely w/ only lua
-- source: https://www.youtube.com/watch?v=ooTcnx066Do
--[[
local job_id = 0
vim.keymap.set("n", "<leader>zx", function()
  vim.cmd.vnew()
  vim.cmd.term()
  vim.cmd.wincmd("J")
  vim.api.nvim_win_set_height(0, 15)

  job_id = vim.bo.channel
end)

vim.keymap.set("n", "<leader>zz", function()
  vim.fn.chansend(job_id, { "echo 'hiiiiii'\r\n" })
end)
]]
