return {
  "mfussenegger/nvim-lint",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local lint = require("lint")

    -- Добавляем поддержку golangci-lint
    lint.linters.golangci_lint = {
      cmd = "golangci-lint",
      args = {
        "run",
        "--out-format=json",
      },
      ignore_exitcode = true, -- чтобы linter не падал вместе с NVIM
    }

    -- Какие линтеры включены по языкам
    lint.linters_by_ft = {
      python = { "pylint" },
      go = { "golangci_lint" }, -- 👈 важное добавление
    }

    -- Группа autocmd для автолинтинга
    local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

    -- Функция запуска линтера
    local function try_linting()
      lint.try_lint()
    end

    -- Автолинт при сохранении, входе в буфер и выходе из вставки
    vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
      group = lint_augroup,
      callback = function()
        try_linting()
      end,
    })

    -- Ручной запуск линтинга
    -- vim.keymap.set("n", "<leader>l", function()
    -- try_linting()
    -- print("Linting…")
    -- end, { desc = "Trigger linting for current file" })
  end,
}
