local lspconfig = require 'lspconfig'

local H = require("helpers")

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


