local ts = require 'nvim-treesitter.configs'

vim.cmd "autocmd BufRead,BufNewFile *.jl :set filetype=julia"

ts.setup {
    ensure_installed = {
        'bash', 'c', 'cpp', 'css', 'dart', 'dockerfile', 'elm', 'erlang', 'go',
        'graphql', 'haskell', 'html', 'javascript', 'jsdoc', 'json', 'jsonc', 'julia',
        'kotlin', 'lua', 'nix', 'python', 'regex', 'rust', 'scss', 'toml',
        'tsx', 'typescript', 'vue', 'yaml'
    },
    highlight = {enable = true}
}


