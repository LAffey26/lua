return {
  "hrsh7th/cmp-nvim-lsp",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    { "antosha417/nvim-lsp-file-operations", config = true },
    { "folke/lazydev.nvim", opts = {} },
  },
  config = function()
    if not package.loaded["lspconfig"] then
      package.preload["lspconfig"] = function()
        return setmetatable({}, {
          __index = function(_, key)
            return {
              setup = function(opts)
                vim.lsp.config(key, opts)
              end,
            }
          end,
        })
      end
    end

    local cmp_nvim_lsp = require("cmp_nvim_lsp")
    local capabilities = cmp_nvim_lsp.default_capabilities()

    vim.lsp.config("*", {
      capabilities = capabilities,
    })
  end,
}
