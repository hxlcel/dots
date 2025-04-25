return{
  'fmbarina/multicolumn.nvim',
  event = { 'BufReadPre', 'BufNewFile' },
  opts = {

    use_default_set = false,

    exclude_floating = true,

    max_lines = 0,

    base_set = {
      scope = 'file', -- file, window, line
      rulers = {}, -- { int, int, ... }
      to_line_end = false,
      full_column = false,
      always_on = false,
      bg_color = nil,
      fg_color = nil,
    },

    sets = {

      -- lua = {
      --   rulers = { 81 },
      --   full_column = true,
      --   to_line_end = true,
      --   always_on = true,
      --   fg_color = "#EB6F92",
      -- },

      python = {
        rulers = { 80 },
        full_column = true,
        to_line_end = true,
        always_on = true,
        fg_color = "#EB6F92",
      }


    }
  },
}
