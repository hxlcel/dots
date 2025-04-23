vim.diagnostic.config {

  -- Current line diagnostic information.
  -- Displays directly under editor text.
  -- Only line occupied by the cursor.
  virtual_lines = false,

    -- current_line = true,
  -- },

  -- Gutter diagnostic icons.
  signs = {
    text = {
      [vim.diagnostic.severity.WARN] = ' ',
      [vim.diagnostic.severity.ERROR] = ' ',
      [vim.diagnostic.severity.HINT] = '󰌵 ',
      [vim.diagnostic.severity.INFO] = ' ',
    },
  },
}

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
