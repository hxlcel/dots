return {
  "nvim-neotest/neotest",
  dependencies = {
    "nvim-neotest/neotest-python",
  },
  opts = function(_, opts)
    local X = require("utils.helpers")
    local python_environment = X.get_env_python()
    table.insert(
      opts.adapters,
      require("neotest-python")({
        -- args = { "--doctest-modules", "--continue-on-fail", "--log-level", "DEBUG" },
        args = { "--doctest-modules", "--log-level", "DEBUG" },
        runner = "pytest",
        python = python_environment,
        -- cwd = function()
        --   return vim.fn.getcwd()
        -- end,
      })
    )
    print("Neotest using Python interpreter: ", python_environment)
  end,
}
