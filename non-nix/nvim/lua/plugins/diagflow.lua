return{
  'dgagn/diagflow.nvim',
  event = { 'BufReadPre', 'BufNewFile' },
  opts = {
    max_height = 15,
    enable = false,
    scope = "line",
    padding_right = 4,
    -- show_borders = true,
    show_borders = false,
  },
}
