local H = require("helpers")

H.map("n", {
    ["<leader>gh"] = ":Gitsigns preview_hunk<CR>",
    ["<leader>gn"] = ":Gitsigns next_hunk<CR>",
    ["<leader>gp"] = ":Gitsigns prev_hunk<CR>",
})
