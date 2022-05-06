local H = require("helpers")

H.map('n', {
    ["<leader>ff"] = "<cmd>Telescope find_files<cr>",
    ["<leader>fg"] = "<cmd>Telescope live_grep<cr>",
    ["<leader>fb"] = "<cmd>Telescope buffers<cr>",
    ["<leader>fh"] = "<cmd>Telescope help_tags<cr>",
    ["<leader>fm"] = "<cmd>Telescope media_files<cr>",
    ["mm"] = "<cmd>Telescope metals commands<cr>"
})

require'telescope'.setup {
    extensions = {
        media_files = {
            filetypes = {
                "png", "webp", "jpg", "jpeg", "mp4", "pdf", "gif", "svg"
            },
            find_cmd = "rg" -- find command (defaults to `fd`)
        }
    }
}

require('telescope').load_extension('media_files')
