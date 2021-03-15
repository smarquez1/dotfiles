vim.cmd [[autocmd BufWritePost init.vim PackerCompile]]
vim.cmd 'packadd packer.nvim' 

return require('packer').startup(function()
  -- Packer can manage itself as an optional plugin
  use { 'wbthomason/packer.nvim', opt = true }
  use 'tpope/vim-commentary'
  use {
    'tpope/vim-fugitive',
    requires = 'tpope/vim-rhubarb' -- git wrapper + Github integration
  }
  use 'tpope/vim-repeat' -- enable repeating supported plugin maps with '.'
  use 'tpope/vim-surround' -- Vim Surround
  use {
    'janko-m/vim-test',
    requires = 'benmills/vimux' -- Vim test runner
  }
  use 'mg979/vim-visual-multi' -- Multiple cursors
  use 'AndrewRadev/splitjoin.vim' -- change between multiline and single-line code
  use 'christoomey/vim-tmux-navigator' -- Seamless navigation between tmux panes and vim splits
  use 'jiangmiao/auto-pairs' -- insert or delete brackets, parens, quotes in pair
  use 'mhinz/vim-signify' -- Git gutter
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
    config = function() require('plugins.compe') end,
    requires = { 'SirVer/ultisnips', 'honza/vim-snippets' }
  }
  -- Navigation
  use {
    'nvim-lua/telescope.nvim',
    requires = {
      'nvim-lua/popup.nvim',
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope-fzy-native.nvim' -- File navigator
    },
    config = {} -- function() require('plugins.telescope') end
  }
  use {
    'junegunn/fzf.vim',
    requires = { 'junegunn/fzf', run = '-> fzf#install()' }
  }
  use 'kyazdani42/nvim-tree.lua'
  use {
    'dyng/ctrlsf.vim', -- Mimics Ctrl-Shift-F on Sublime Text 2
    config = function() require('plugins.ctrlsf') end
  }

  use {
    'neovim/nvim-lspconfig',
    config = function() require('lsp/init') end
  }
  use 'nvim-lua/lsp-status.nvim'

  use 'kosayoda/nvim-lightbulb'

  -- Appearance
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
    config = function() require('nvim-web-devicons').setup({ default = true; }) end -- icons for lua plugins
  }
  use 'dstein64/nvim-scrollview'
  use {
    'norcalli/nvim-colorizer.lua',
    config = function() require('colorizer').setup() end
  }
  -- Ruby
  use {
    'ecomba/vim-ruby-refactoring',
    'p0deje/vim-ruby-interpolation', -- Simple plugin to add {} after hitting #
    'tpope/vim-endwise',             -- add 'end' to functons
    'tpope/vim-rails'               -- rails.vim: Ruby on Rails power tools
  }

  -- HTMLish
  use 'Valloric/MatchTagAlways' -- Highlights enclosing html/xml tags
  use {
    'mattn/emmet-vim',
    ft = {
      'html', 'javascript', 'typescript', 'javascriptreact', 'typescriptreact'
    }
  }
  use 'AndrewRadev/tagalong.vim' -- Change opening tag and closing tags
  use 'tpope/vim-ragtag' -- ex <% %>, <%= %>, <!-- -->
  -- Other
  use 'chrisbra/csv.vim'

  local map = require('utils').map

  vim.g.nvim_tree_width_allow_resize = 1
  vim.g.nvim_tree_indent_markers = 1
  vim.g.nvim_tree_auto_close = 1
  vim.g.nvim_tree_follow = 1
  vim.g.nvim_tree_hide_dotfiles = 1
  vim.g.nvim_tree_git_hl = 1
  vim.g.nvim_tree_disable_netrw = 0 -- So :GBrowse works
  vim.g.nvim_tree_hijack_netrw = 0
  vim.g.nvim_tree_bindings = {
	  ["l"] = ":lua require'nvim-tree'.on_keypress('edit')<CR>",
	  ["h"] = ":lua require'nvim-tree'.on_keypress('close_node')<CR>",
  }

  map('n', '<leader>d', ':NvimTreeToggle<cr>')

  vim.api.nvim_exec(
  [[
    let test#strategy = "vimux"
    let test#ruby#use_binstubs = 0
    nmap <leader>T :TestFile<CR>
    nmap <leader>t :TestNearest<CR>
    nmap <leader>l :TestLast<CR>

    nmap <leader>gd :Gdiff<CR>
    " Open current line in the browser
    nmap <leader>gb :.Gbrowse<CR>
    " Open visual selection in the browser
    vmap <leader>gb :Gbrowse<CR>

    autocmd FileType javascript,javascriptreact,typescript,typescriptreact UltiSnipsAddFiletypes javascript.javascriptreact.typescript.typescriptreact

    let $fzf_default_command = 'fd --type f'
    let $fzf_default_opts .= '--layout=reverse --inline-info'
    autocmd filetype fzf tmap <buffer> <c-j> <down>
    autocmd filetype fzf tmap <buffer> <c-k> <up>

    " use shif-tab to expand, default: `<c-y>,`
    " imap <s-tab> <plug>(emmet-expand-abbr)

    nmap <silent> <leader>f :Files<cr>
    nmap <silent> <leader>b :Buffers<cr>
    nmap <silent> <leader>gb :Gbranches<cr>
    nmap <silent> <leader>ht :Helptags<cr>
    " list all yadm tracked files
    nmap <silent> <leader>ed :call fzf#run(fzf#wrap({'source': 'yadm list -a', 'dir': '~' }))<cr>
    " rails
    " find models
    nmap <silent> <leader>em :call fzf#run(fzf#wrap({'source': 'git ls-files', 'dir': 'app/models' }))<cr>
    nmap <silent> <leader>ec :call fzf#run(fzf#wrap({'source': 'git ls-files', 'dir': 'app/controllers' }))<cr>
    nmap <silent> <leader>ev :call fzf#run(fzf#wrap({'source': 'git ls-files', 'dir': 'app/views' }))<cr>
  ]]
  , true)

  vim.g.fugitive_git_executable = 'LANG=en_US git'

  vim.g.UltiSnipsExpandTrigger="<c-l>"
  vim.g.UltiSnipsJumpForwardTrigger="<tab>"
  vim.g.UltiSnipsJumpBackwardTrigger="<s-tab>"

  -- Customize fzf colors to match your color scheme
  -- https://github.com/junegunn/fzf.vim/issues/1152#issuecomment-747156597
  vim.g.fzf_colors = {
    fg =      { 'fg', 'Normal' },
    bg =      { 'bg', 'Normal' },
    hl =      { 'fg', 'Comment' },
    ['fg+'] = { 'fg', 'CursorLine', 'CursorColumn', 'Normal' },
    ['bg+'] = { 'bg', 'CursorLine', 'CursorColumn' },
    ['hl+'] = { 'fg', 'Statement' },
    info =    { 'fg', 'PreProc' },
    border =  { 'fg', 'Ignore' },
    prompt =  { 'fg', 'Conditional' },
    pointer = { 'fg', 'Exception' },
    marker =  { 'fg', 'Keyword' },
    spinner = { 'fg', 'Label' },
    header =  { 'fg', 'Comment' }
  }

  vim.g.endwise_no_mappings=1
  map('n', '<leader>a', ':A<cr>')
  map('n',  '<leader>av', ':AV <cr>')
  map('n', '<leader>as', ':AS<cr>')

  vim.g.mta_filetypes = {
    html = 1,
    javascriptreact = 1,
    typescriptreact = 1,
    eruby = 1,
    markdown = 1
  }

  vim.g.ragtag_global_maps = 1

  vim.g.csv_strict_columns = 1
  vim.g.csv_start = 1
  vim.g.csv_end = 1000
end)
