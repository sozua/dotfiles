-- Rxyhn colorscheme (local)
return {
  name = "rxyhn",
  dir = vim.fn.stdpath("config") .. "/lua/rxyhn",
  lazy = false,
  priority = 1000,
  config = function()
    require("rxyhn").setup()
  end,
}
