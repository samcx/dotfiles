local keymap = vim.keymap

return {
  {
    -- Find, Filter, Preview, Pick. All Lua, all the time.
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      local builtin = require("telescope.builtin")

      keymap.set("n", "<C-p>", builtin.find_files, { desc = "[S]earch [F]iles" })
      keymap.set("n", "<leader>sg", builtin.live_grep, { desc = "[S]earch by [G]rep" })
    end,
  }
}
