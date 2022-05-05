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

lspconfig.julials.setup{}  -- JULIA
lspconfig.hls.setup{}      -- HASKELL
-- lspconfig.metals.setup{}   -- SCALA nvim-metals solves
local metals_config = require("metals").bare_config()

-- Example of settings
metals_config.settings = {
  showImplicitArguments = true,
  excludedPackages = { "akka.actor.typed.javadsl", "com.github.swagger.akka.javadsl" },
}
local api = vim.api
local nvim_metals_group = api.nvim_create_augroup("nvim-metals", { clear = true })
api.nvim_create_autocmd("FileType", {
  -- NOTE: You may or may not want java included here. You will need it if you
  -- want basic Java support but it may also conflict if you are using
  -- something like nvim-jdtls which also works on a java filetype autocmd.
  pattern = { "scala", "sbt", "java" },
  callback = function()
    require("metals").initialize_or_attach(metals_config)
  end,
  group = nvim_metals_group,
})


lspconfig.ccls.setup{}     -- C/CPP
lspconfig.tsserver.setup { -- TYPESCRIPT
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
    ['<leader>ds'] = '<cmd>lua vim.lsp.buf.document_symbol()<CR>',
    ['<leader>fe'] = '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>',
    ['<leader>se'] = '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>'
})

H.map('n', {
    ['<leader>xx'] = '<cmd>TroubleToggle<cr>',
    ['<leader>xw'] = '<cmd>TroubleToggle lsp_workspace_diagnostics<cr>',
    ['<leader>xd'] = '<cmd>TroubleToggle lsp_document_diagnostics<cr>',
    ['<leader>xq'] = '<cmd>TroubleToggle quickfix<cr>',
    ['<leader>xl'] = '<cmd>TroubleToggle loclist<cr>',
    ['<leader>xr'] = '<cmd>TroubleToggle lsp_references<cr>'
})

