" Airline
let g:airline_theme='dracula'
let g:airline_section_y = ''
let g:airline#extensions#whitespace#enabled = 0
let g:airline_skip_empty_sections = 1


" CTRLSF
let g:ctrlsf_ackprg = 'rg' " Use rg as backend
let g:ctrlsf_auto_close = { "normal" : 0, "compact": 0 } " Disable auto close
let g:ctrlsf_auto_focus = { "at": "start" } " Focus Ctrlsf buffer after it's called

" coc.nvim
let g:coc_global_extensions = [
  \ 'coc-css', 
  \ 'coc-emmet',
  \ 'coc-eslint',
  \ 'coc-explorer',
  \ 'coc-git',
  \ 'coc-html',
  \ 'coc-pairs',
  \ 'coc-snippets',
  \ 'coc-solargraph',
  \ 'coc-stylelint',
  \ 'coc-tsserver',
  \ ]

" Show docs on hover
" function! ShowDocIfNoDiagnostic(timer_id)
"   if (coc#util#has_float() == 0)
"     silent call CocActionAsync('doHover')
"   endif
" endfunction

" function! s:show_hover_doc()
"   call timer_start(500, 'ShowDocIfNoDiagnostic')
" endfunction

" Show documentation on hover
" autocmd CursorHoldI * :call <SID>show_hover_doc()
" autocmd CursorHold * :call <SID>show_hover_doc()

" CSV.vim
let g:csv_autocmd_arrange = 1
let g:csv_autocmd_arrange_size = 1024*1024

" IndentLine
let g:indentLine_enabled = 0
let g:indentLine_char = '│'
let g:indentLine_fileTypeExclude = ['help', 'coc-explorer', 'csv']

" MatchTagAlways
let g:mta_filetypes = {
    \ 'html' : 1,
    \ 'javascriptreact' : 1,
    \ 'eruby' : 1,
    \ 'liquid' : 1,
    \ 'markdown' : 1
    \}

" FZF
let $FZF_DEFAULT_COMMAND = 'rg --files --follow --glob "!.git/*"'
let $FZF_DEFAULT_OPTS .= ' --layout=reverse'
let g:fzf_preview_window = '' " Disable preview windows
let g:fzf_layout = { 'window': 
  \ { 'width': 0.80, 'height': 0.5, 'yoffset': 0, 'border': 'rounded' } }

" Fugitive
let g:fugitive_git_executable = 'LANG=en_US git'

" Polyglot
" Ragtag
let g:ragtag_global_maps = 1

" Multi
" let g:VM_highlight_matches = 'value'

" Vim-test
" let test#neovim#term_position = "vert"
let test#strategy = "vimux"
" let g:test#ruby#rspec#executable = 'bundle exec rspec'
let test#ruby#use_binstubs = 0
