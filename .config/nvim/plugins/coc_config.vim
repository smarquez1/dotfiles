let g:coc_global_extensions = [	
  \ 'coc-css', 	
  \ 'coc-eslint',	
  \ 'coc-explorer',	
  \ 'coc-html',	
  \ 'coc-pairs', 	
  \ 'coc-snippets',	
  \ 'coc-solargraph',	
  \ 'coc-stylelint',	
  \ 'coc-tsserver',	
  \ ]

" " LSP
" " Stow hover documentation when holding the cursor
" " autocmd CursorHold * silent call CocAction('doHover')

" check if last inserted char is a backspace
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Avoid showing message extra message when using completion
set shortmess+=c

" " completion using TAB
" " Use tab for trigger completion with characters ahead and navigate.
" " NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" " other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

let g:coc_snippet_next = '<tab>'

" nmap <silent><C-]> <Plug>(coc-definition)
nmap <silent>gd <Plug>(coc-definition)
nmap <silent>K  :call CocAction('doHover')<CR>
nmap <silent>gy <Plug>(coc-type-definition)
nmap <silent>gi <Plug>(coc-implementation)
nmap <silent>gr <Plug>(coc-references)
nmap <leader>gR <Plug>(coc-rename)
nmap <leader>ac <Plug>(coc-codeaction)
xmap <leader>af <Plug>(coc-format-selected)
vmap <leader>af <Plug>(coc-format-selected)
nmap <leader>af <Plug>(coc-format-selected)
" Apply AutoFix to problem on the current line.
nmap <leader>qf <Plug>(coc-fix-current)
" Applying codeAction to the selected region.  Example: `<leader>aap` for current paragraph
" xmap <leader>a  <Plug>(coc-codeaction-selected)
" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')
" Coc-explore
nmap <leader>d :CocCommand explorer<CR>

" Replace Ctrlsf
" nmap <leader>/ :CocSearch <c-r>
" vmap <leader>/ :CocSearch <c-r>=expand("<cword>")<CR><CR>
