local H = require("helpers") -- vim helpers

local globals = vim.g
vim.opt_global.shortmess:remove("F") -- from nvim-metals
globals.mapleader = ','
vim.opt.number = true
vim.opt.clipboard = "unnamedplus"
vim.opt.updatetime = 200
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4

require("plugins")
require("nvimTree")
require("icons")
require("theme")
require("treesitter")
require("lsp")
require("nvimCompe")
require("gitsigns").setup()
require("telescopeConfig")
require("statusline")
require("gitsignsConfig")

-- Mappings
H.map('n', {
    ["<S-q>"]     = ":tabnext<CR>",
    ["<S-Tab>"]   = ":tabprev<CR>",
    ["<S-t>"]     = ":tabnew<CR>",
    ["<C-h>"]     = ":wincmd h<CR>",
    ["<C-l>"]     = ":wincmd l<CR>",
    ["<C-k>"]     = ":wincmd k<CR>",
    ["<C-j>"]     = ":wincmd j<CR>",
    ["<A-Right>"] = ":vertical resize +5<CR>",
    ["<A-Left>"]  = ":vertical resize -5<CR>",
    ["<A-Up>"] = ":resize +5<CR>",
    ["<A-Down>"]  = ":resize -5<CR>",
    ["<leader>q"] = ":bp<CR>",
    ["<leader>w"] = ":bn<CR>",
    ["<leader>c"] = ":bd<CR>",
    ["<C-S-r>"]    = ":source $MYVIMRC<CR>"
})
