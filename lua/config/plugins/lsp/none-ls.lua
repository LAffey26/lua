
return {
  "nvimtools/none-ls.nvim",               -- configure formatters & linters
  lazy = true,
  ft ={ "py", "html", "js", "ts", "lua", "cpp", "c" },
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "jay-babu/mason-null-ls.nvim",
    "williamboman/mason.nvim",
    "MunifTanjim/prettier.nvim",
  },
  config = function()
    local mason_null_ls = require("mason-null-ls")
    mason_null_ls.setup({
      "stylua",   -- lua formatter
      "isort",    -- python formatter
      "black",    -- python formatter
      "pylint",   -- python linter
    })

    -- for conciseness
    local null_ls = require("null-ls")
    local null_ls_utils = require("null-ls.utils")
    local formatting = null_ls.builtins.formatting
    local diagnostics = null_ls.builtins.diagnostics

    -- to setup format on save
    local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

    -- configure null_ls
    null_ls.setup({
      root_dir = null_ls_utils.root_pattern(".null-ls-root", "Makefile", ".git", "package.json"),
      sources = {
        formatting.stylua, -- lua formatter
        formatting.isort,
        formatting.black,
        diagnostics.pylint,
        formatting.clang_format, -- clang-format for C++
      },
      on_attach = function(current_client, bufnr)
        if current_client.supports_method("textDocument/formatting") then
          vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
          vim.api.nvim_create_autocmd("BufWritePre", {
            group = augroup,
            buffer = bufnr,
            callback = function()
              vim.lsp.buf.format({
                -- only use null-ls for formatting instead of lsp server
                filter = function(client)
                  return client.name == "null-ls"
                end,
                async = false,
              })
            end,
          })
        end
      end,
    })
  end,
}

