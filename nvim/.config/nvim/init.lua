vim.env.LUA_PATH = nil
vim.env.LUA_CPATH = nil

vim.api.nvim_create_autocmd("User", {
  pattern = "LazyDone",
  callback = function()
    if vim.loader then
      vim.loader.reset()
    end
  end,
})

require('config.lazy')

-- Jump to last position before jump
vim.keymap.set("n", "<leader>n", "``", { desc = "Jump to last position" })

-- Relative line numbers
vim.opt.number = true
vim.opt.relativenumber = true
