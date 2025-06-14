return {
  "mfussenegger/nvim-dap",

  lazy = false,

  dependencies = {
    "rcarriga/nvim-dap-ui",
    {
      "theHamsta/nvim-dap-virtual-text",
      opts = {},
    },
    {
      "mfussenegger/nvim-dap-python",
      config = function()
        local python_path = require("utils.helpers").get_env_python()
        require("dap-python").setup(python_path, {
          console = "integratedTerminal",
        })
      end,
    },
  },
  -- stuylua: ignore start
  keys = {
    {
      "<leader>td",
      function()
        require("neotest").run.run({ strategy = "dap" })
      end,
      desc = "Debug nearest",
    },

    {
      "<leader>dB",
      function()
        require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: "))
      end,
      desc = "Breakpoint Condition",
    },
    {
      "<leader>db",
      function()
        require("dap").toggle_breakpoint()
      end,
      desc = "Toggle Breakpoint",
    },
    {
      "<leader>dc",
      function()
        require("dap").continue()
      end,
      desc = "Run/Continue",
    },
    {
      "<leader>da",
      function()
        require("dap").continue({ before = get_args })
      end,
      desc = "Run with Args",
    },
    {
      "<leader>dC",
      function()
        require("dap").run_to_cursor()
      end,
      desc = "Run to Cursor",
    },
    {
      "<leader>dg",
      function()
        require("dap").goto_()
      end,
      desc = "Go to Line (No Execute)",
    },
    {
      "<leader>di",
      function()
        require("dap").step_into()
      end,
      desc = "Step Into",
    },
    {
      "<leader>dj",
      function()
        require("dap").down()
      end,
      desc = "Down",
    },
    {
      "<leader>dk",
      function()
        require("dap").up()
      end,
      desc = "Up",
    },
    {
      "<leader>dl",
      function()
        require("dap").run_last()
      end,
      desc = "Run Last",
    },
    {
      "<leader>do",
      function()
        require("dap").step_out()
      end,
      desc = "Step Out",
    },
    {
      "<leader>dO",
      function()
        require("dap").step_over()
      end,
      desc = "Step Over",
    },
    {
      "<leader>dP",
      function()
        require("dap").pause()
      end,
      desc = "Pause",
    },
    {
      "<leader>dr",
      function()
        require("dap").repl.toggle()
      end,
      desc = "Toggle REPL",
    },
    {
      "<leader>ds",
      function()
        require("dap").session()
      end,
      desc = "Session",
    },
    {
      "<leader>dt",
      function()
        require("dap").terminate()
      end,
      desc = "Terminate",
    },
    {
      "<leader>dw",
      function()
        require("dap.ui.widgets").hover()
      end,
      desc = "Widgets",
    },

    {
      "<leader>dn",
      function()
        require("dap-python").test_method()
      end,
      desc = "Test method (dap-python)",
    },
    {
      "<leader>df",
      function()
        require("dap-python").test_class()
      end,
      desc = "Test class (dap-python)",
    },
    {
      "<leader>ds",
      function()
        require("dap-python").debug_selection()
      end,
      desc = "Test method (dap-python)",
    },
  },
  -- stuylua: ignore end

  config = function()
    vim.api.nvim_set_hl(0, "DapStoppedLine", { default = true, link = "Visual" })
  end,
}
