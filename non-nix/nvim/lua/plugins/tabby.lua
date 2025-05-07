return {
  "nanozuki/tabby.nvim",
  config = function()
    local theme = {
      fill = "TabLineFill",
      head = "TabLine",
      current_tab = "TabLineSel",
      tab = "TabLine",
      win = "TabLine",
      tail = "TabLine",
    }

    require("tabby.tabline").set(function(line)
      return {
        {
          line.sep("", theme.head, theme.fill),
          { "", hl = theme.head },
          line.sep("", theme.head, theme.fill),
        },
        line.tabs().foreach(function(tab)
          local hl = tab.is_current() and theme.current_tab or theme.tab
          return {
            line.sep("", hl, theme.fill),
            tab.is_current() and "" or "",
            tab.number(),
            tab.name(),
            -- tab.close_btn(''), -- show a close button
            line.sep("", hl, theme.fill),
            hl = hl,
            margin = " ",
          }
        end),
        line.spacer(),
        {
          line.sep("", theme.tail, theme.fill),
          { "  ", hl = theme.tail },
        },
        hl = theme.fill,
      }
    end)
  end,
  -- keys = {
  --   { "<C-w>t", ":$tabnew<CR>", desc = "New tab" },
  -- },
}
