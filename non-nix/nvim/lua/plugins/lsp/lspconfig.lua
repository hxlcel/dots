return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    { "antosha417/nvim-lsp-file-operations", config = true },
    { "folke/lazydev.nvim" },
  },

  config = function()
    -- local lspconfig = require("lspconfig")
    local keymap = vim.keymap -- for conciseness

    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("UserLspConfig", {}),
      callback = function(ev)
        -- Buffer local mappings.
        -- See `:help vim.lsp.*` for documentation on any of the below functions
        local opts = { buffer = ev.buf, silent = true }

        opts.desc = "See available code actions"
        keymap.set({ "n", "v" }, "<leader>la", vim.lsp.buf.code_action, opts) -- see available code actions, in visual mode will apply to selection

        opts.desc = "Smart rename"
        keymap.set("n", "<leader>ln", vim.lsp.buf.rename, opts) -- smart rename

        opts.desc = "Show documentation for what is under cursor"
        keymap.set("n", "K", vim.lsp.buf.hover, opts) -- show documentation for what is under cursor

        opts.desc = "Restart LSP"
        keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts) -- mapping to restart lsp if necessary
      end,
    })

    local original_capabilities = vim.lsp.protocol.make_client_capabilities()
    local capabilities = require("blink.cmp").get_lsp_capabilities(original_capabilities)

    -- ###---- LSP Servers ----###

    vim.lsp.enable("lua_ls") -- Note: Lazydev.nvim required to avoid `undefined global vim` errors (also improves nvim qol by a lot)
    vim.lsp.enable("pylsp")
    vim.lsp.enable("nixd")
    vim.lsp.enable("vscode-html-language-server")
    -- vim.lsp.enable("emmet-ls")

    vim.lsp.config("*", {
      capabilities = capabilities,
      root_markers = { ".git" },
    })

    vim.lsp.config("lua_ls", {
      cmd = { "lua-language-server" },
      settings = {
        ["lua_ls"] = {
          filetypes = { "lua" },
          Lua = {
            runtime = { version = "LuaJIT" },
          },
          telemetry = { enabled = false },
        },
      },
    })

    vim.lsp.config("pylsp", {
      -- root_dir = require("lspconfig.util").root_pattern(".git", "setup.py", "pyproject.toml"),
      root_markers = { "setup.py", "pyproject.toml" },
      cmd = { "pylsp" },
      filetypes = { "python" },
      settings = {
        ["pylsp"] = {
          plugins = {
            mypy = { enable = true },
            flake8 = { enabled = true },
            black = { enabled = true },

            -- Disable superseded defaults
            pycodestyle = { enabled = false },
            mccabe = { enabled = false },
            pyflakes = { enabled = false },
          },
        },
      },
    })

    vim.lsp.config("nixd", {
      cmd = { "nixd" },
      filetypes = { "nix" },
    })

    vim.lsp.config("vscode-html-language-server", {
      cmd = { "vscode-html-language-server", "--stdio" },
      filetypes = { "html" },
      settings = {
        ["vscode-html-language-server"] = {
          configurationSection = { "html", "css", "javascript" },
          embeddedLanguages = {
            css = true,
            javascript = true,
          },
        },
      },
    })
  end,
}
