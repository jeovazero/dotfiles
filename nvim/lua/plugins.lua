return require('packer').startup(function()
    use 'wbthomason/packer.nvim'

    use "kyazdani42/nvim-web-devicons"
    use {
        'kyazdani42/nvim-tree.lua',
        requires = {
          'kyazdani42/nvim-web-devicons', -- optional, for file icon
        }
    }

    use 'folke/tokyonight.nvim'
    use 'tiagovla/tokyodark.nvim'

    use "nvim-treesitter/nvim-treesitter"
    use "neovimhaskell/haskell-vim"
    use "neovim/nvim-lspconfig"

    use {
      "folke/trouble.nvim",
      requires = "kyazdani42/nvim-web-devicons",
      config = function()
        require("trouble").setup {}
      end
    }

    use "hrsh7th/nvim-compe"

    use {'lewis6991/gitsigns.nvim', requires = {'nvim-lua/plenary.nvim'}}

    use {
        'nvim-telescope/telescope.nvim',
        requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}
    }

    use 'nvim-telescope/telescope-media-files.nvim'
    -- use 'wakatime/vim-wakatime'

    
    -- install without yarn or npm
    use({
        "iamcco/markdown-preview.nvim",
        run = function() vim.fn["mkdp#util#install"]() end,
    })

    use({ "iamcco/markdown-preview.nvim", run = "cd app && npm install", setup = function() vim.g.mkdp_filetypes = { "markdown" } end, ft = { "markdown" }, })

    use {
        'hoob3rt/lualine.nvim',
        requires = {'kyazdani42/nvim-web-devicons', opt = true}
    }
    use "nvim-lua/plenary.nvim"

    use({
        "hrsh7th/nvim-cmp",
        requires = {
          { "hrsh7th/cmp-nvim-lsp" },
          { "hrsh7th/cmp-vsnip" },
          { "hrsh7th/vim-vsnip" },
        },
      })

     use {
      'akinsho/flutter-tools.nvim',
      requires = {
         'nvim-lua/plenary.nvim',
         'stevearc/dressing.nvim', -- optional for vim.ui.select
      },
    }
    --[[
    use({
      "scalameta/nvim-metals",
      requires = {
        "nvim-lua/plenary.nvim",
        "mfussenegger/nvim-dap",
      },
    })
    ]]--
end)
