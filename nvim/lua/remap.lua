local keymap = vim.keymap

-- Save file in INSERT mode
keymap.set({ "i", "n" }, "<C-s>", "<Esc>:w<CR>", { desc = "Save file" })

-- Yank into the system clipboard
keymap.set({ "v" }, "<leader>y", [["+y]], { desc = "[Y]ank to clipboard" })
