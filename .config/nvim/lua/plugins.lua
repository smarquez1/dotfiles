vim.cmd 'packadd packer.nvim'
vim.cmd [[autocmd BufWritePost plugins.lua PackerCompile]]

return require('packer').startup({ function(use)
  use { 'wbthomason/packer.nvim', opt = true }
  use 'windwp/nvim-spectre'

  use {
    'tpope/vim-fugitive', -- git wrapper
    requires = 'tpope/vim-rhubarb', -- Github integration
    config = function() require('plugins.fugitive') end
  }
  use 'tpope/vim-repeat' -- enable repeating supported plugin maps with '.'
  use 'tpope/vim-surround' -- Vim Surround
  use {
    'janko-m/vim-test', -- Vim test runner
    requires = 'benmills/vimux', -- Tmux integration
    config = function() require('plugins.vim_test') end
  }
  use 'mg979/vim-visual-multi' -- Multiple cursors
  use 'AndrewRadev/splitjoin.vim' -- change between multiline and single-line code
  use 'christoomey/vim-tmux-navigator' -- Seamless navigation between tmux panes and vim splits
  use 'ggandor/lightspeed.nvim'
  use {
    'lewis6991/gitsigns.nvim', -- display git information in the gutter
    requires = { 'nvim-lua/plenary.nvim' },
    config = function() require('gitsigns').setup() end
  }
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    requires = {
      'andymass/vim-matchup',
      'JoosepAlviste/nvim-ts-context-commentstring', -- sets the TS commentstring based on the cursor location in a file.
      'windwp/nvim-ts-autotag',
      "windwp/nvim-autopairs",
      -- 'RRethy/nvim-treesitter-textsubjects',
      -- 'mfussenegger/nvim-ts-hint-textobject',
      -- 'nvim-treesitter/nvim-treesitter-textobjects',
      -- 'p00f/nvim-ts-rainbow',
    },
    config = function() require('plugins.treesitter') end
  }
  -- https://github.com/siduck76/NvChad/blob/main/lua/pluginList.lua
  use {
    "windwp/nvim-autopairs",
    after =  "nvim-compe",
    config = function()
      require("nvim-autopairs").setup()
      require("nvim-autopairs.completion.compe").setup(
	{
	  map_cr = true,
	  map_complete = true -- insert () func completion
	}
      )
    end
  }
  use 'b3nj5m1n/kommentary'

  use {
    'hrsh7th/nvim-compe',
    requires = {
      'hrsh7th/vim-vsnip',
      'hrsh7th/vim-vsnip-integ',
      'rafamadriz/friendly-snippets',
    },
    config = function() require('plugins.compe') end
  }
  use 'folke/which-key.nvim'
  use {
    "folke/todo-comments.nvim",
    requires = "nvim-lua/plenary.nvim",
    config = function() require("todo-comments").setup() end
  }

  -- Navigation
  use {
    'nvim-lua/telescope.nvim',
    requires = {
      'nvim-lua/popup.nvim',
      'nvim-lua/plenary.nvim',
      { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' },
      'nvim-telescope/telescope-github.nvim',
      'sudormrfbin/cheatsheet.nvim',
    },
    config = function() require('plugins.telescope') end
  }
  use {
    'kyazdani42/nvim-tree.lua',
    config = function() require('plugins.nvim_tree') end
  }
  use {
    'dyng/ctrlsf.vim', -- Mimics Ctrl-Shift-F on Sublime Text 2
    config = function() require('plugins.ctrlsf') end
  }
  -- LSP
  use {
    'neovim/nvim-lspconfig',
    config = function() require('lsp.init') end
  }
  -- Appearance
  use 'folke/tokyonight.nvim'
  use { 'lukas-reineke/indent-blankline.nvim',
    config = function() require('plugins.indent_blankline') end
  }
  use 'henrik/vim-indexed-search' -- Display number of search results
  use {
    'hoob3rt/lualine.nvim',
    config = function() require('plugins.lualine') end
  }
  use {
    'akinsho/nvim-bufferline.lua',
    config = function() require('plugins.bufferline') end
  }
  use 'karb94/neoscroll.nvim'
  use 'kyazdani42/nvim-web-devicons'
  use {
    'norcalli/nvim-colorizer.lua',
    config = function() require('colorizer').setup() end
  }
  -- Language specific
  use 'ecomba/vim-ruby-refactoring'
  use 'p0deje/vim-ruby-interpolation' -- Simple plugin to add {} after hitting #
  use {
    'tpope/vim-rails', -- rails.vim: Ruby on Rails power tools
    config = function() require('plugins.vim_rails') end
  }
  use 'kchmck/vim-coffee-script'
  use {
    'mattn/emmet-vim',
    ft = {
      'html', 'javascript', 'typescript', 'javascriptreact', 'typescriptreact',
      'eruby'
    }
  }
  use 'tomlion/vim-solidity'
  use 'chrisbra/csv.vim'
end })
