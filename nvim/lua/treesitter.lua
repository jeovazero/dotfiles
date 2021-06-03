local ts = require 'nvim-treesitter.configs'

ts.setup {
    ensure_installed = {
        'bash', 'c', 'cpp', 'css', 'dart', 'dockerfile', 'erlang', 'go',
        'graphql', 'html', 'javascript', 'jsdoc', 'json', 'jsonc', 'julia',
        'kotlin', 'lua', 'nix', 'python', 'regex', 'rust', 'scss', 'toml',
        'tsx', 'typescript', 'vue', 'yaml'
    },
    highlight = {enable = true}
}


