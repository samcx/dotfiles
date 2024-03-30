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

    vim.keymap.set({ "n" }, "<C-r>", ":Neotree toggle<CR>", {
      desc = "Toggle Neotree",
      silent = true,
    })
  end,
}
