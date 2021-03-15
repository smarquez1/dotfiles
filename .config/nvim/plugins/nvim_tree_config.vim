let g:nvim_tree_width_allow_resize = 1
let g:nvim_tree_indent_markers = 1
let g:nvim_tree_auto_close = 1
let g:nvim_tree_follow = 1
let g:nvim_tree_hide_dotfiles = 1
let g:nvim_tree_git_hl = 1
let g:nvim_tree_disable_netrw = 0 " So :GBrowse works
let g:nvim_tree_hijack_netrw = 0

lua <<EOF
    vim.g.nvim_tree_bindings = {
      ["l"] = ":lua require'nvim-tree'.on_keypress('edit')<CR>",
      ["h"] = ":lua require'nvim-tree'.on_keypress('close_node')<CR>",
    }
EOF

nmap <leader>d :NvimTreeToggle<CR>
