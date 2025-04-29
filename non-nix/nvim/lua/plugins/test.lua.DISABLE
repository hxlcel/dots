return {
  "nvim-neotest/neotest",
  dependencies = {
    "nvim-neotest/neotest-python"
  },
  opts = function(_, opts)
    table.insert(
      opts.adapters,
      require("neotest-python")({
        runner = "pytest",
        cwd = function()
          return vim.fn.getcwd()
        end,
      })
    )
  end,
}
