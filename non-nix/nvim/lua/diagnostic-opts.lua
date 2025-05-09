vim.diagnostic.config({

  -- Current line diagnostic information.
  -- Displays directly under editor text.
  -- Only line occupied by the cursor.
  -- virtual_lines = { current_line = true },
  underline = true,

  -- Gutter diagnostic icons.
  signs = {
    text = {
      [vim.diagnostic.severity.WARN] = " ",
      [vim.diagnostic.severity.ERROR] = " ",
      [vim.diagnostic.severity.HINT] = "󰌵 ",
      [vim.diagnostic.severity.INFO] = " ",
    },
  },
  float = {
    -- source = true,
    scope = "line",
    -- pos =
  },
  -- virtual_text = {
  --   source = true,
  --   current_line = true,
  -- },
})

-- ### Floating Diagnostics
-- TODO: This setup is kinda lazy, how can i improve it?

vim.api.nvim_create_autocmd({ "DiagnosticChanged", "CursorMoved" }, {
  pattern = "*",
  callback = function()
    vim.diagnostic.open_float(nil, { focus = false })
  end,
})

-- vim.api.nvim_create_autocmd( {"CursorHold"}, {
--   pattern = "*",
--   callback = function ()
--     vim.lsp.buf.hover()
--   end
-- })

-- TODO: Create abstraction for highlight groups.
-- should work with todo-comments without
-- additional intervention.

-- -- Change the Diagnostic symbols in the sign column (gutter)
-- -- (not in youtube nvim video)
-- local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
-- for type, icon in pairs(signs) do
--   local hl = "DiagnosticSign" .. type
--   vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
-- end
