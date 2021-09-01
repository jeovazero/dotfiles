local ts = require 'nvim-treesitter.configs'

vim.cmd "autocmd BufRead,BufNewFile *.jl :set filetype=julia"
vim.cmd "autocmd BufRead,BufNewFile *.nix :set filetype=nix"

ts.setup {
    -- 'haskell' has a bad performance for medium and big files
    -- https://github.com/tree-sitter/tree-sitter-haskell/issues/41
    ensure_installed = {
        'bash', 'c', 'cpp', 'css', 'dart', 'dockerfile', 'elm', 'erlang', 'go',
        'graphql', 'html', 'javascript', 'jsdoc', 'json', 'jsonc', 'julia',
        'kotlin', 'lua', 'nix', 'python', 'regex', 'rust', 'scss', 'toml',
        'tsx', 'typescript', 'vue', 'yaml'
    },
    highlight = {enable = true}
}


