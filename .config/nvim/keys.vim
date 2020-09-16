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

" CtrlSF
" nmap <leader>/ :CocSearch <c-r>
" vmap <leader>/ :CocSearch <c-r>=expand("<cword>")<CR><CR>
nmap <leader>/ <Plug>CtrlSFPrompt
vmap <leader>/ <Plug>CtrlSFVwordPath

" COMPLETION
" Emmet
imap <S-tab> <plug>(emmet-expand-abbr)

" Navigate completion menu
imap <expr> <C-j> pumvisible() ? "\<C-N>" : "j"
imap <expr> <C-k> pumvisible() ? "\<C-P>" : "k"

" completion using TAB
" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
function! s:check_back_space() abort
  let col = col('.') - 1

  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" coc
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> K  :call CocAction('doHover')<CR>
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

nmap <leader>rn  <Plug>(coc-rename)
nmap <leader>ac  <Plug>(coc-codeaction)
xmap <leader>af  <Plug>(coc-format-selected)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)
" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Coc-explore
" Open CHADTree
nmap <leader>d :CocCommand explorer<CR>

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
