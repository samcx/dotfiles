local keymap = vim.keymap

return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
  },
  config = function()
    require("neo-tree").setup({
      default_component_configs = {
        icon = {
          folder_closed = "",
          folder_open = "",
          folder_empty = "",
          default = "",
        },
      },
      window = {
        position = "right",
      },
    })

    keymap.set({ "n" }, "<C-r>", ":Neotree toggle<CR>", {
      desc = "Toggle Neotree",
      silent = true,
    })
    keymap.set({ "n" }, "<C-[>", ":bprevious<CR>", { desc = "Navigate to previous buffer" })
    keymap.set({ "n" }, "<C-]>", ":bnext<CR>", { desc = "Navigate to next buffer" })
    keymap.set({ "n" }, "<C-w>", ":bd<CR>", { desc = "Close current buffer" })
  end,
}
