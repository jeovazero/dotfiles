return require('packer').startup(function()
    use 'wbthomason/packer.nvim'

    use "kyazdani42/nvim-tree.lua"
    use "kyazdani42/nvim-web-devicons"

    use 'folke/tokyonight.nvim'
    use 'tiagovla/tokyodark.nvim'

    use "nvim-treesitter/nvim-treesitter"
    use "neovim/nvim-lspconfig"

    use "hrsh7th/nvim-compe"

    use {'lewis6991/gitsigns.nvim', requires = {'nvim-lua/plenary.nvim'}}

    use {
        'nvim-telescope/telescope.nvim',
        requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}
    }

    use 'nvim-telescope/telescope-media-files.nvim'
    use 'wakatime/vim-wakatime'

    use {
        'iamcco/markdown-preview.nvim',
        run = 'cd app && yarn install',
        cmd = 'MarkdownPreview'
    }

    use {
        'hoob3rt/lualine.nvim',
        requires = {'kyazdani42/nvim-web-devicons', opt = true}
    }
end)
