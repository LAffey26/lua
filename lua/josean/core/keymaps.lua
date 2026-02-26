--leader
vim.g.mapleader = " "
local map = vim.keymap.set

--general
map("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })
map("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })
map("n", "<leader>a", "gg0vG<S-$>", { desc = "Sellect all" })

-- increment/decrement numbers
map("n", "<leader>+", "<C-a>", { desc = "Increment number" })
map("n", "<leader>-", "<C-x>", { desc = "Decrement number" })
map("n", "<leader>w", ":w<CR>", { desc = "Saving  file changes" })
map("n", "<leader>q", ":q!<CR>", { desc = "Exiting the nvim editor" })

-- window management
map("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" })
map("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" })
map("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" })
map("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" })

--tabs
map("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" })
map("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" })
map("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" })
map("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" })
map("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" })

-- Latex
map("n", "<leader>l", function()
  local filepath = vim.fn.expand("%:r") .. ".pdf"
  local cmd = string.format("zathura %s &", filepath)
  vim.cmd("silent !" .. cmd)
end, { desc = "zathura staring file PDF" })

-- map("n", "<leader>l", function()
--   if vim.bo.filetype ~= "typst" then
--     return
--   end
--
--   -- сначала сохранить файл, чтобы точно был на диске
--   vim.cmd("silent write")
--
--   local typ = vim.fn.expand("%:p")
--   local pdf = vim.fn.expand("%:p:r") .. ".pdf"
--
--   -- compile безопасно (без проблем с пробелами)
--   vim.cmd("silent !typst compile " .. vim.fn.shellescape(typ) .. " " .. vim.fn.shellescape(pdf))
--
--   -- watch (один раз на буфер)
--   if not vim.b.typst_watch_job or vim.b.typst_watch_job == 0 then
--     vim.b.typst_watch_job = vim.fn.jobstart({ "typst", "watch", typ, pdf }, { detach = true })
--   end
--
--   -- открыть zathura
--   vim.cmd("silent !zathura " .. vim.fn.shellescape(pdf) .. " &")
-- end, { desc = "Typst: compile + start watch + open zathura" })
--
-- vim.api.nvim_create_autocmd({ "TextChanged", "TextChangedI" }, {
--   pattern = { "*.typ", "*.typst" },
--   callback = function()
--     vim.cmd("silent write")
--   end,
-- })
