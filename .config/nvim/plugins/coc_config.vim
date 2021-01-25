let g:coc_global_extensions = [	
  \ 'coc-snippets',	
  \ 'coc-css', 	
  \ 'coc-eslint',	
  \ 'coc-html',	
  \ 'coc-json', 	
  \ 'coc-lua',	
  \ 'coc-solargraph',	
  \ 'coc-stylelintplus',	
  \ 'coc-tsserver',	
  \ 'coc-yaml', 	
  \ ]

" LSP
" nmap <silent><C-]> <Plug>(coc-definition)
nmap <silent>gd <Plug>(coc-definition)
nmap <silent>K  :call CocAction('doHover')<CR>
nmap <silent>gy <Plug>(coc-type-definition)
nmap <silent>gi <Plug>(coc-implementation)
nmap <silent>gr <Plug>(coc-references)
nmap <leader>gR <Plug>(coc-rename)
nmap <leader>ac <Plug>(coc-codeaction)
" Formatting selected code.
xmap <leader>af  <Plug>(coc-format-selected)
nmap <leader>af <Plug>(coc-format-selected)
" Apply AutoFix to problem on the current line.
nmap <leader>qf <Plug>(coc-fix-current)
" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
" xmap <leader>a  <Plug>(coc-codeaction-selected)
" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Snippets
" Completion does not select anything automatically
set completeopt=noinsert,menuone,noselect
" Do not display "Pattern not found" messages during completion.
set shortmess+=c
" Navigate popup menues with j and k
inoremap <expr> <C-J> pumvisible() ? "\<C-N>" : "j"
inoremap <expr> <C-K> pumvisible() ? "\<C-P>" : "k"

" completion using TAB
" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.

" check if last inserted char is a backspace
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

function s:tab_completion() abort
  if pumvisible()
    return coc#_select_confirm() 
  endif

  if coc#expandableOrJumpable()
    return "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>"
  endif

  if s:check_back_space()
    return "\<TAB>"
  endif

  return coc#refresh()
endfunction

inoremap <silent><expr> <TAB> <sid>tab_completion()

" Use <TAB> for jump to next placeholder
let g:coc_snippet_next = '<TAB>'
" Use <S-TAB> for jump to previous placeholder
let g:coc_snippet_prev = '<S-TAB>'
