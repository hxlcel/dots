return {
  "nvim-neotest/neotest",
  dependencies = {
    "nvim-neotest/neotest-python",
  },
  opts = function(_, opts)
    table.insert(
      opts.adapters,
      require("neotest-python")({
        -- args = { "--doctest-modules", "--continue-on-fail", "--log-level", "DEBUG" },
        args = { "--doctest-modules", "--log-level", "DEBUG" },
        runner = "pytest",
        python = Get_env_python(),
        vim.g.python,
        cwd = function()
          return vim.fn.getcwd()
        end,
      })
    )
  end,
}
