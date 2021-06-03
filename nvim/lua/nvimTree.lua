local H = require("helpers")

local g = vim.g

vim.o.termguicolors = true

g.nvim_tree_side = 'left'
g.nvim_tree_width = 30
g.nvim_tree_ignore = { '.git', 'node_modules', '.cache' }
g.nvim_tree_gitignore = 1
g.nvim_tree_auto_open = 1
g.nvim_tree_auto_close = 1
g.nvim_tree_quit_on_open = 0 
g.nvim_tree_follow = 1
g.nvim_tree_indent_markers = 1
g.nvim_tree_hide_dotfiles = 0
g.nvim_tree_git_hl = 1
g.nvim_tree_highlight_opened_files = 1
g.nvim_tree_tab_open = 1
g.nvim_tree_width_allow_resize = 1
g.nvim_tree_disable_netrw = 1
g.nvim_tree_hijack_netrw = 1
g.nvim_tree_add_trailing = 0
g.nvim_tree_group_empty = 1 
g.nvim_tree_lsp_diagnostics = 0
g.nvim_tree_disable_window_picker = 0

H.map('n', {
  ["<F3>"] = ":NvimTreeToggle<CR>",
  ["<leader>r"] = ":NvimTreeRefresh<CR>",
  ["<leader>n"] = ":NvimTreeFindFile<CR>",
})
g.nvim_tree_special_files = { 'README.md', 'Makefile', 'MAKEFILE' }

g.nvim_tree_icons = {
    default = '',
    symlink = '',
    git = {
      unstaged = "✗",
      staged = "✓",
      unmerged = "",
      renamed = "➜",
      untracked = "★",
      deleted = "",
      ignored = "◌"
    },
    folder = {
      default = "",
      open = "",
      empty = "",
      empty_open = "",
      symlink = "",
      symlink_open = "",
    },
    lsp = {
      hint = "",
      info = "",
      warning = "",
      error = "",
    }
}
