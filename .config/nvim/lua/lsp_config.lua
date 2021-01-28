local U = require './utils'
local lsp = require 'lspconfig'
local lsp_status = require 'lsp-status'
-- local saga = require 'lspsaga'
-- saga.init_lsp_saga()

local custom_on_attach = function(client, bufnr)
  lsp_status.on_attach(client)
end

lsp.solargraph.setup {
  settings = { solargraph = { diagnostics = true } },
  on_attach = custom_on_attach
}

lsp.tsserver.setup {
  on_attach = custom_on_attach
}

--https://github.com/anott03/nvim-lspinstall
-- \ 'coc-css',
-- \ 'coc-stylelintplus',
-- \ 'coc-eslint',
-- \ 'coc-html',
-- \ 'coc-json',	
-- \ 'coc-lua',
-- \ 'coc-yaml',	

lsp_status.register_progress()

-- Mappings
U.map('n', '<silent>gd', ':lua vim.lsp.buf.definition()<cr>')
U.map('n', '<silent>K' , ':lua vim.lsp.buf.hover()<cr>')
U.map('n', '<silent>gr', ':lua vim.lsp.buf.references()<cr>')

U.map('n', '<leader>gR', ':lua vim.lsp.buf.rename()<cr>')
U.map('n', '<leader>af', ':lua vim.lsp.buf.formatting()<cr>')

-- U.map('n', '<leader>s', ':lua vim.lsp.buf.document_symbol()<cr>')
-- U.opt('o', 'completion_matching_strategy_list', ['exact', 'substring', 'fuzzy'])

-- TODO: Convert from vimlang + coc
-- also: https://github.com/tjdevries/config_manager/blob/master/xdg_config/nvim/lua/tj/snippets.lua
-- and: https://github.com/tjdevries/config_manager/blob/master/xdg_config/nvim/lua/tj/completion.lua
--https://github.com/tjdevries/config_manager/blob/master/xdg_config/nvim/lua/tj/completion.lua
--https://github.com/steelsojka/completion-buffers
--https://github.com/albertoCaroM/completion-tmux
--
--https://github.com/norcalli/snippets.nvim
--let g:completion_enable_snippet = 'UltiSnips'
-- " Snippets
-- " Completion does not select anything automatically
-- set completeopt=noinsert,menuone,noselect
-- " Do not display "Pattern not found" messages during completion.
-- set shortmess+=c
-- " Navigate popup menues with j and k
-- inoremap <expr> <C-J> pumvisible() ? "\<C-N>" : "j"
-- inoremap <expr> <C-K> pumvisible() ? "\<C-P>" : "k"

-- " completion using TAB
-- " Use tab for trigger completion with characters ahead and navigate.
-- " NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
-- " other plugin before putting this into your config.

-- " check if last inserted char is a backspace
-- function! s:check_back_space() abort
--   let col = col('.') - 1
--   return !col || getline('.')[col - 1]  =~# '\s'
-- endfunction

-- function s:tab_completion() abort
--   if pumvisible()
--     return coc#_select_confirm()
--   endif

--   if coc#expandableOrJumpable()
--     return "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>"
--   endif

--   if s:check_back_space()
--     return "\<TAB>"
--   endif

--   return coc#refresh()
-- endfunction

-- inoremap <silent><expr> <TAB> <sid>tab_completion()

-- " Use <TAB> for jump to next placeholder
-- let g:coc_snippet_next = '<TAB>'
-- " Use <S-TAB> for jump to previous placeholder
-- let g:coc_snippet_prev = '<S-TAB>'
