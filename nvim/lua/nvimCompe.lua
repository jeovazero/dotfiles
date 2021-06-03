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


