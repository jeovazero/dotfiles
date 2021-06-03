local F = require("F") -- fns
local H = require("helpers") -- vim helpers

require("plugins")

local globals = vim.g
globals.mapleader = ','
vim.o.number = true
vim.w.number = true
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

require("nvimTree")
require("icons")

vim.cmd "colorscheme tokyonight"
vim.g.tokyonight_style = "storm"
vim.g.tokyonight_dark_sidebar = true

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

local lspconfig = require 'lspconfig'

local function eslint_config_exists()
  local eslintrc = vim.fn.glob(".eslintrc*", 0, 1)

  if not vim.tbl_isempty(eslintrc) then
    return true
  end

  if vim.fn.filereadable("package.json") then
    if vim.fn.json_decode(vim.fn.readfile("package.json"))["eslintConfig"] then
      return true
    end
  end

  return false
end

lspconfig.tsserver.setup {
    cmd = {"typescript-language-server", "--stdio"},
    filetypes = {
        "javascript", "javascriptreact", "javascript.jsx", "typescript",
        "typescriptreact", "typescript.tsx"
    },
    root_dir = lspconfig.util.root_pattern("package.json", "tsconfig.json",
                                           "jsconfig.json", ".git")
}
local eslint = {
    lintCommand = "eslint_d -f unix --stdin --stdin-filename ${INPUT}",
    lintIgnoreExitCode = true,
    lintStdin = true,
    lintFormats = {"%f:%l:%c: %m"},
    formatCommand = "eslint_d --fix-to-stdout --stdin --stdin-filename=${INPUT}",
    formatStdin = true
}
lspconfig.efm.setup {
    on_attach = function(client)
        client.resolved_capabilities.document_formatting = true
        -- on_attach_common(client)
    end,
    init_options = {documentFormatting = true},
    root_dir = function()
        if not eslint_config_exists() then
            return nil
        end
        return vim.fn.getcwd()
    end,
    settings = {
        languages = {
            typescript = {eslint},
            javascript = {eslint},
            typescriptreact = {eslint},
            javascriptreact = {eslint},
            ["javascript.jsx"] = {eslint},
            ["typescript.tsx"] = {eslint},
            json = {eslint},
            css = {eslint},
        }
    },
    filetypes = {
        "javascript",
        "javascriptreact",
        "javascript.jsx",
        "typescript",
        "typescript.tsx",
        "typescriptreact",
        "css"
    }
}


H.map('n', {
    ['dp'] = '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>',
    ['dn'] = '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>',
    ['<leader>fa'] = '<cmd>lua vim.lsp.buf.code_action()<CR>',
    ['td'] = '<cmd>lua vim.lsp.buf.definition()<CR>',
    ['<leader>ft'] = '<cmd>lua vim.lsp.buf.formatting()<CR>',
    ['<leader>s'] = '<cmd>lua vim.lsp.buf.hover()<CR>',
    ['<leader>rn'] = '<cmd>lua vim.lsp.buf.rename()<CR>',
    ['tr'] = '<cmd>lua vim.lsp.buf.references()<CR>',
    ['<leader>ds'] = '<cmd>lua vim.lsp.buf.document_symbol()<CR>'
})

-- compe
vim.o.completeopt = "menuone,noselect"
require'compe'.setup {
    enabled = true,
    autocomplete = true,
    debug = false,
    min_length = 1,
    preselect = 'enable',
    throttle_time = 80,
    source_timeout = 200,
    incomplete_delay = 400,
    max_abbr_width = 100,
    max_kind_width = 100,
    max_menu_width = 100,
    documentation = true,

    source = {
        path = true,
        buffer = false,
        calc = true,
        nvim_lsp = true,
        nvim_lua = true,
        vsnip = false,
        ultisnips = true
    }
}
local function t(str)
    return vim.api.nvim_replace_termcodes(str, true, true, true)
end
function _G.smart_tab()
    return vim.fn.pumvisible() == 1 and t '<C-n>' or t '<Tab>'
end
iopts = {expr = true, silent = true, noremap = false}
function _G.compComplete() return vim.fn['compe#complete']() end
function _G.compConfirm() return vim.fn['compe#confirm'](t'<CR>') end
function _G.compClose() return vim.fn['compe#close'](t'<C-e>') end
function _G.compScroll(a) return vim.fn['compe#scroll']({delta = a}) end
H.map('i', {
    ['<Tab>'] = {'v:lua.smart_tab()', {expr = true}},
    ['<C-Space>'] = {'v:lua.compComplete()', {expr = true, silent = true}},
    ['<CR>'] = {'v:lua.compConfirm()', {expr = true, silent = true}},
    ['<C-e>'] = {'v:lua.compClose()', {expr = true, silent = true}},
    ['<C-f>'] = {'v:lua.compScroll(+4)', {expr = true, silent = true}},
    ['<C-d>'] = {'v:lua.compScroll(-4)', {expr = true, silent = true}}
})

require('gitsigns').setup()

H.map('n', {
    ["<leader>ff"] = "<cmd>Telescope find_files<cr>",
    ["<leader>fg"] = "<cmd>Telescope live_grep<cr>",
    ["<leader>fb"] = "<cmd>Telescope buffers<cr>",
    ["<leader>fh"] = "<cmd>Telescope help_tags<cr>",
    ["<leader>fm"] = "<cmd>Telescope media_files<cr>"
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
