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

" completion using TAB
function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <TAB>
  \ pumvisible() ? "\<C-n>" :
  \ <SID>check_back_space() ? "\<TAB>" :
  \ completion#trigger_completion()

" Use K to show documentation in preview window.

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

" nvim-lspconfig {{{
nnoremap <silent> gd    <cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap <silent> <c-]> <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> K     <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> gD    <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> <c-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> 1gD   <cmd>lua vim.lsp.buf.type_definition()<CR>
nnoremap <silent> gr    <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> g0    <cmd>lua vim.lsp.buf.document_symbol()<CR>
nnoremap <silent> gW    <cmd>lua vim.lsp.buf.workspace_symbol()<CR>
" }}}


" Vim Test
nmap <leader>T :TestFile<CR>
nmap <leader>t :TestNearest<CR>
nmap <leader>l :TestLast<CR>

" Rails
nmap <leader>a :A <cr>
nmap <leader>av :AV <cr>
nmap <leader>as :AS <cr>
