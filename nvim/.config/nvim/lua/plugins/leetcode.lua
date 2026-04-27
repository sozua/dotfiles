return {
    "kawre/leetcode.nvim",
    build = ":TSUpdate html",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "MunifTanjim/nui.nvim",
    },
    lazy = "leet" ~= vim.fn.argv(0, -1),
    opts = {
        arg = "leet",
        lang = "python3",
        picker = {
            provider = "telescope",
        },
        hooks = {
            ["question_enter"] = {
                function()
                    local map = function(key, cmd, desc)
                        vim.keymap.set("n", key, cmd, { buffer = true, desc = desc })
                    end
                    map("<leader>lm", "<cmd>Leet<cr>", "LeetCode: Menu")
                    map("<leader>ld", "<cmd>Leet daily<cr>", "LeetCode: Daily")
                    map("<leader>ll", "<cmd>Leet list<cr>", "LeetCode: List")
                    map("<leader>lr", "<cmd>Leet run<cr>", "LeetCode: Run")
                    map("<leader>ls", "<cmd>Leet submit<cr>", "LeetCode: Submit")
                    map("<leader>lt", "<cmd>Leet desc toggle<cr>", "LeetCode: Toggle description")
                    map("<leader>lc", "<cmd>Leet console<cr>", "LeetCode: Console")
                    map("<leader>li", "<cmd>Leet info<cr>", "LeetCode: Problem info")
                    map("<leader>lh", "<cmd>Leet hints<cr>", "LeetCode: Hints")
                    map("<leader>lR", "<cmd>Leet reset<cr>", "LeetCode: Reset code")
                    map("<leader>ly", "<cmd>Leet yank<cr>", "LeetCode: Yank code")
                    map("<leader>lL", "<cmd>Leet lang<cr>", "LeetCode: Change language")
                    map("<leader>lo", "<cmd>Leet open<cr>", "LeetCode: Open in browser")
                end,
            },
        },
    },
}
