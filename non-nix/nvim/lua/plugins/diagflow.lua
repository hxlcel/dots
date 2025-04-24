return{
  'dgagn/diagflow.nvim',
  event = { 'BufReadPre', 'BufNewFile' },
  opts = {
    max_height = 15,
    enable = true,
    scope = "line",
    padding_right = 4,
    show_borders = true,
  },
}
