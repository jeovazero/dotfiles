local H = require("helpers") -- vim helpers

local globals = vim.g
globals.mapleader = ','
vim.o.number = true
vim.w.number = true

require("plugins")
require("nvimTree")
require("icons")
require("theme")
require("treesitter")
require("lsp")
require("nvimCompe")
require("gitsigns").setup()
require("telescopeConfig")

-- Mappings
H.map('n', {
    ["<Tab>"] = ":tabnext<CR>",
    ["<S-Tab>"] = ":tabprev<CR>",
    ["<S-t>"] = ":tabnew<CR>",
    ["<C-h>"] = ":wincmd h<CR>",
    ["<C-l>"] = ":wincmd l<CR>",
    ["<C-k>"] = ":wincmd k<CR>",
    ["<C-j>"] = ":wincmd j<CR>"
})
