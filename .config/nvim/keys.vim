" map Leader
let mapleader = " "
" semi colon is colon
map ; :
noremap <leader>w :w <cr> " Save file
" Quicker window movement
nmap <c-j> <c-w>j
nmap <c-k> <c-w>k
nmap <c-l> <c-w>l
nmap <c-h> <c-w>h
" Easy splitting
map <leader>s :split <cr>
map <leader>v :vsplit <cr>
" Tab management
nnoremap <leader>c :tabnew<CR>
" inoremap <C-S-tab> <Esc>:tabprevious<CR>i
" inoremap <C-tab>   <Esc>:tabnext<CR>i
nnoremap <leader>1 1gt
nnoremap <leader>2 2gt
nnoremap <leader>3 3gt
nnoremap <leader>4 4gt
nnoremap <leader>5 5gt
" Replace hashrockets with 1.9 hash style syntax
nnoremap <leader>: :%s/:\(\w\+\)\s*=>\s*/\1: /g <cr>
" Re-Open Previously Opened File
" nnoremap <leader><leader> :e#<CR>
" Cancel a search with Escape:
nnoremap <silent> <Esc> :nohlsearch<Bar>:echo<CR>
" Quickly open/reload config
" nnoremap <leader>ev :e $MYVIMRC; cd ~/.config/nvim<CR>
nnoremap <leader>rv :source $MYVIMRC<CR>
" Make navigation into and out of Neovim terminal splits nicer.
tnoremap <C-h> <C-\><C-N><C-w>h
tnoremap <C-j> <C-\><C-N><C-w>j
tnoremap <C-k> <C-\><C-N><C-w>k
tnoremap <C-l> <C-\><C-N><C-w>l
" Escape from terminal goes to normal mode
" tnoremap <Esc> <C-\><C-n>
" Like gJ, but always remove spaces
fun! JoinSpaceless()
    execute 'normal gJ'

    " Character under cursor is whitespace?
    if matchstr(getline('.'), '\%' . col('.') . 'c.') =~ '\s'
        " When remove it!
        execute 'normal dw'
    endif
endfun
nnoremap <Leader>J :call JoinSpaceless()<CR>

" map . in visual mode
vnoremap . :norm.<cr>
" unmap ex mode: 'Type visual to go into Normal mode.'
nnoremap Q <nop>
" saner cursor positioning after yanking blocks
vnoremap <expr>y "my\"" . v:register . "y`y"
" Navigate completion menu
inoremap <expr> <C-j> pumvisible() ? "\<C-N>" : "j"
inoremap <expr> <C-k> pumvisible() ? "\<C-P>" : "k"

" Ctrlsf
nmap <leader>/ <Plug>CtrlSFPrompt
vmap <leader>/ <Plug>CtrlSFVwordPath


" coc-vim
" Auto Fix
nmap <silent> <C-]> <Plug>(coc-definition)
" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)
" coc-explorer
" Open Explorer on projects root
nmap <leader>d :CocCommand explorer --reveal expand('%:p') <CR>
" Highlight current opened file
nmap <leader>D :CocCommand explorer <CR>
" nmap <leader>d :CocCommand explorer --preset floating<CR>

" Use <C-l> for trigger snippet expand.
" imap <C-l> <Plug>(coc-snippets-expand)
" Use <C-j> for select text for visual placeholder of snippet.
" vmap <C-j> <Plug>(coc-snippets-select)
" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<c-j>'
" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-k>'

" inoremap <silent><expr> <TAB>
"       \ pumvisible() ? "\<C-n>" :
"       \ <SID>check_back_space() ? "\<TAB>" :
"       \ coc#refresh()
" inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" Make <tab> used for trigger completion, completion confirm, snippet
" expand and jump like VSCode.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<tab>'

" Fugitive git bindings
nnoremap <Leader>gs :Gstatus<CR>
nnoremap <Leader>gd :Gdiff<CR>
" Show commits for every source line
" nnoremap <Leader>gb :Gblame<CR>  " git blame
" Open current line in the browser
nnoremap <Leader>gb :.Gbrowse<CR>
" Open visual selection in the browser
vnoremap <Leader>gb :Gbrowse<CR>

" FZF
noremap <silent> <leader>f :FZF <CR>

" Vim Test
nmap <leader>T :TestFile<CR>
nmap <leader>t :TestNearest<CR>
nmap <leader>l :TestLast<CR>

" Rails
nmap <leader>a :A <cr>
nmap <leader>av :AV <cr>
nmap <leader>as :AS <cr>

