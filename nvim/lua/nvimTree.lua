local H = require("helpers")

vim.opt.termguicolors = true
vim.opt.splitright = true

H.map('n', {
  ["<F3>"] = ":NvimTreeToggle<CR>",
  ["<leader>r"] = ":NvimTreeRefresh<CR>",
  ["<leader>n"] = ":NvimTreeFindFile<CR>",
})
-- <C-t> will open the file in a new tab
-- type r to rename a file
-- <Tab> will open the file as a preview (keeps the cursor in the tree)
-- I will toggle visibility of hidden folders / files
-- H will toggle visibility of dotfiles (files/folders starting with a .)
-- C-k will toggle a popup with file infos about the file under the cursor

require'nvim-tree'.setup {
  git = {
    enable = true,
    ignore = true,
    timeout = 400,
  },
  diagnostics = {
    enable = false,
    show_on_dirs = false,
    icons = {
      hint = "",
      info = "",
      warning = "",
      error = "",
    },
  },
  actions = {
    open_file = {
        resize_window = true
    },
  },
}

