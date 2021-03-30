vim.cmd 'packadd packer.nvim'

vim.cmd [[autocmd BufWritePost plugins.lua PackerCompile]]

return require('packer').startup(function()
  -- Packer can manage itself as an optional plugin
  use { 'wbthomason/packer.nvim', opt = true }
  use 'tpope/vim-commentary'
  use 'JoosepAlviste/nvim-ts-context-commentstring'
  use {
    'tpope/vim-fugitive',
    requires = 'tpope/vim-rhubarb', -- git wrapper + Github integration
    config = function() require('plugins.fugitive') end
  }
  use 'tpope/vim-repeat' -- enable repeating supported plugin maps with '.'
  use 'tpope/vim-surround' -- Vim Surround
  use {
    'janko-m/vim-test',
    requires = 'benmills/vimux', -- Vim test runner
    config = function() require('plugins.vim_test') end
  }
  use 'mg979/vim-visual-multi' -- Multiple cursors
  use 'AndrewRadev/splitjoin.vim' -- change between multiline and single-line code
  use 'christoomey/vim-tmux-navigator' -- Seamless navigation between tmux panes and vim splits
  use 'jiangmiao/auto-pairs' -- insert or delete brackets, parens, quotes in pair
  use {
    'lewis6991/gitsigns.nvim',
    requires = { 'nvim-lua/plenary.nvim' },
    config = function() require('gitsigns').setup() end
  }

  use {
    'akinsho/nvim-bufferline.lua',
    config = function() require('bufferline').setup() end
  }
	
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    config = function() require('plugins.treesitter') end
  }

  use {
    'hrsh7th/nvim-compe',
    requires = {
      'SirVer/ultisnips', 'honza/vim-snippets', 'hrsh7th/vim-vsnip', 'rafamadriz/friendly-snippets'
    },
    config = function() require('plugins.compe') end
  }

  -- Navigation
  use {
    'nvim-lua/telescope.nvim',
    requires = {
      'nvim-lua/popup.nvim',
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope-fzy-native.nvim',
      'nvim-telescope/telescope-media-files.nvim'
    },
    -- config = function() require('plugins.telescope') end
  }

  use {
    'junegunn/fzf.vim',
    requires = { 'junegunn/fzf', run = '-> fzf#install()' },
    config = function() require('plugins.fzf') end
  }

  use {
    'kyazdani42/nvim-tree.lua',
    config = function() require('plugins.nvim_tree') end
  }

  use {
    'dyng/ctrlsf.vim', -- Mimics Ctrl-Shift-F on Sublime Text 2
    config = function() require('plugins.ctrlsf') end
  }

  -- use { 'phaazon/hop.nvim', branch = 'pre-extmarks' }

  -- LSP

  use {
    'neovim/nvim-lspconfig',
    requires = 'glepnir/lspsaga.nvim',
    config = function() require('lsp.init') end
  }

  use 'nvim-lua/lsp-status.nvim'

  -- Appearance
  use 'kosayoda/nvim-lightbulb'

  use { 'lukas-reineke/indent-blankline.nvim', branch = 'lua',
    config = function()
      vim.g.indent_blankline_buftype_exclude = {'terminal'}
      vim.g.indent_blankline_filetype_exclude = {'help', 'packer', }
      vim.g.indent_blankline_char = '▏'
      vim.g.indent_blankline_show_trailing_blankline_indent = false
      vim.g.indent_blankline_show_current_context = true
      vim.g.indent_blankline_use_treesitter=true
      vim.wo.colorcolumn = "99999"
    end
  }

  use 'henrik/vim-indexed-search' -- Display number of search results

  use {
    'hoob3rt/lualine.nvim',
    config = function() require('plugins.lualine') end
  }

  use {
    'joshdick/onedark.vim', -- Colorscheme based on atom onedark
    config = function() require('plugins.onedark') end
  }

  use {
    'kyazdani42/nvim-web-devicons',
    config = function() require('plugins.nvim_web_devicons') end
  }

  use 'dstein64/nvim-scrollview'

  use {
    'norcalli/nvim-colorizer.lua',
    config = function() require('colorizer').setup() end
  }

  -- -- Ruby
  use {
    'ecomba/vim-ruby-refactoring',
    'p0deje/vim-ruby-interpolation', -- Simple plugin to add {} after hitting #
    {
      use 'tpope/vim-rails',               -- rails.vim: Ruby on Rails power tools
      {
        config = function()
          local map = require('utils').map

          map('n', '<leader>a', ':A<cr>')
          map('n',  '<leader>av', ':AV <cr>')
          map('n', '<leader>as', ':AS<cr>')
        end
      }
    }
  }

  -- -- HTMLish
  use 'windwp/nvim-ts-autotag'

  -- TODO: remove when TS is stable ?
  -- use {
  --   'tpope/vim-ragtag', -- ex <% %>, <%= %>, <!-- -->
  --   config = function() vim.g.ragtag_global_maps = 1 end
  -- }

  use {
    'mattn/emmet-vim',
    ft = {
      'html', 'javascript', 'typescript', 'javascriptreact', 'typescriptreact', 'eruby'
    }
    -- autocmd FileType html,css EmmetInstall
  }

  -- Others
	use {
		'sheerun/vim-polyglot',
		config = function()
      vim.g.polyglot_disabled = {'sensible'}
      vim.g.csv_strict_columns = 1
      vim.g.csv_start = 1
      vim.g.csv_end = 1000
    end
	}
end)
