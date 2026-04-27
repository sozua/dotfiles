return {
  "mistweaverco/kulala.nvim",
  ft = { "http", "rest" },
  opts = {
    -- default_view = "body",  -- "body" | "headers" | "headers_body"
    -- split_direction = "vertical",  -- "vertical" | "horizontal"
  },
  keys = {
    { "<leader>rs", "<cmd>lua require('kulala').run()<cr>", desc = "Send request", ft = "http" },
    { "<leader>ra", "<cmd>lua require('kulala').run_all()<cr>", desc = "Send all requests", ft = "http" },
    { "<leader>rp", "<cmd>lua require('kulala').jump_prev()<cr>", desc = "Previous request", ft = "http" },
    { "<leader>rn", "<cmd>lua require('kulala').jump_next()<cr>", desc = "Next request", ft = "http" },
    { "<leader>ri", "<cmd>lua require('kulala').inspect()<cr>", desc = "Inspect request", ft = "http" },
    { "<leader>rt", "<cmd>lua require('kulala').toggle_view()<cr>", desc = "Toggle body/headers", ft = "http" },
    { "<leader>rc", "<cmd>lua require('kulala').copy()<cr>", desc = "Copy as cURL", ft = "http" },
    { "<leader>re", "<cmd>lua require('kulala').set_selected_env()<cr>", desc = "Select environment", ft = "http" },
  },
}
