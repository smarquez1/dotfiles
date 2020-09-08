" ma pLeader
let mapleader = " "
" Semicolon is colon
map ; :
" Save file
map <leader>w :w <cr>
" Quicker window movement
nmap <c-j> <c-w>j
nmap <c-k> <c-w>k
nmap <c-l> <c-w>l
nmap <c-h> <c-w>h
" Make navigation into and out of Neovim terminal splits nicer.
tmap <C-h> <C-\><C-N><C-w>h
tmap <C-j> <C-\><C-N><C-w>j
tmap <C-k> <C-\><C-N><C-w>k
tmap <C-l> <C-\><C-N><C-w>l
" Easy splitting
map <leader>s :split <cr>
map <leader>v :vsplit <cr>
" Tab management
nmap <leader>c :tabnew<CR>
nmap <leader>1 1gt
nmap <leader>2 2gt
nmap <leader>3 3gt
" Replace hashrockets with 1.9 hash style syntax
nmap <leader>: :%s/:\(\w\+\)\s*=>\s*/\1: /g <cr>
" Re-Open Previously Opened File
" nmap <leader><leader> :e#<CR>
" Cancel a search with Escape:
nmap <silent> <Esc> :nohlsearch<Bar>:echo<CR>
" Quickly open/reload config
" nmap <leader>ev :e $MYVIMRC; cd ~/.config/nvim<CR>
nmap <leader>rv :source $MYVIMRC<CR>
" Escape from terminal goes to normal mode
" tmap <Esc> <C-\><C-n>
" map . in visual mode
vmap . :norm.<cr>
" unmap ex mode: 'Type visual to go into Normal mode.'
nmap Q <nop>
" saner cursor positioning after yanking blocks
" vmap <expr>y "my\"" . v:register . "y`y"

" diff
if &diff
    map <C-J> ]c
    map <C-K> [c
endif

" Ctrlsf
nmap <leader>/ <Plug>CtrlSFPrompt
vmap <leader>/ <Plug>CtrlSFVwordPath

" COMPLETION
" Emmet
imap <S-tab> <plug>(emmet-expand-abbr)

" Navigate completion menu
imap <expr> <C-j> pumvisible() ? "\<C-N>" : "j"
imap <expr> <C-k> pumvisible() ? "\<C-P>" : "k"

" coc completion
inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" : coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" let g:coc_snippet_next = '<tab>'
" Ultisnips
" prevent coc issues
let g:UltiSnipsExpandTrigger = "<nop>"
" coc
" GoTo code navigation.
nmap <silent> <C-]> <Plug>(coc-definition)
nmap <silent> gd <Plug>(coc-definition)
" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)
" Use K to show documentation in preview window.
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction
nmap <silent> K :call <SID>show_documentation()<CR>

nmap <leader>ac  <Plug>(coc-codeaction)
" Formatting selected code.
xmap <leader>af  <Plug>(coc-format-selected)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" CHADTree
" Open CHADTree
nnoremap <leader>d <cmd>CHADopen<cr>
" Highlight current opened file
" nmap <leader>D :CocCommand explorer <CR>

" Fugitive git bindings
nmap <Leader>gs :Gstatus<CR>
nmap <Leader>gd :Gdiff<CR>
" Open current line in the browser
nmap <Leader>gb :.Gbrowse<CR>
" Open visual selection in the browser
vmap <Leader>gb :Gbrowse<CR>

" FZF
map <silent> <leader>f :Files <CR>
" map <silent> <leader>c :Files ~/.config/nvim <CR>
map <silent> <leader>c call fzf#vim#files('~/.config/nvim', <bang>0) <CR>
map <silent> <leader>b :Buffers <CR>
map <silent> <leader>G :Rg <CR>

" Vim Test
nmap <leader>T :TestFile<CR>
nmap <leader>t :TestNearest<CR>
nmap <leader>l :TestLast<CR>

" Rails
nmap <leader>a :A <cr>
nmap <leader>av :AV <cr>
nmap <leader>as :AS <cr>
