vim.g.mapleader = " "

local keymap = vim.keymap

--General keymaps

keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode" })

--tubs
keymap.set("n", "to", "<cmd>tabnew<CR>", { desc = "Open new tab" })
keymap.set("n", "tn", "<cmd>tabn<CR>", { desc = "Go to next tab" })
keymap.set("n", "tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" })
keymap.set("n", "tx", "<cmd>tabclose<CR>", { desc = "Close current tab" })

--Nvim-tree
keymap.set("n", "<leader>ee", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle file explorer" })
keymap.set("n", "<leader>ef", "<cmd>NvimTreeFindFileToggle<CR>", { desc = "Toggle file explorer on current file" })
keymap.set("n", "<leader>ec", "<cmd>NvimTreeCollapse<CR>", { desc = "Collapse file explorer" })
keymap.set("n", "<leader>er", "<cmd>NvimTreeRefresh<CR>", { desc = "Refresh file explorer" })

--Telescope
keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Fuzzy find files in cwd" })
keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>", { desc = "Find string in cwd" })

--Side keymaps
keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })
keymap.set("n", "<leader>w", ":w<CR>", { desc = "Saving  file changes" })
keymap.set("n", "<leader>q", ":q!<CR>", { desc = "Exiting the nvim editor" })
keymap.set("n", "<leader>r", ":RunCode<CR>i", { desc = "Code runnder" })
keymap.set("n", "<leader>a", "gg0vG<S-$>")
keymap.set("n", "<leader>8", ":lua vim.lsp.stop_client(vim.lsp.get_active_clients())<CR>",{desc="Stop lsp client"})
keymap.set("n", "<leader>9", ":LspRestart<CR>",{desc="Restart lsp client"})
-- LaTeX
-- zathura
keymap.set("n", "<leader>l", function()
  local filepath = vim.fn.expand('%:r') .. ".pdf"
  local cmd = string.format("zathura %s &", filepath)
  vim.cmd("silent !" .. cmd)
end, { desc = "zathura staring file PDF" })

