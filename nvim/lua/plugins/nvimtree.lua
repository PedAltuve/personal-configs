return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = false,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
 },
  config = function()
    require("nvim-tree").setup {}
    vim.keymap.set('n', '<C-n>', require('nvim-tree.api').tree.toggle, { desc = 'Toggle nvim-tree' })
  end,
}
