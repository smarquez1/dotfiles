vim.api.nvim_exec(
[[
let test#strategy = "vimux"
let test#ruby#use_binstubs = 0
nmap <leader>T :TestFile<CR>
nmap <leader>t :TestNearest<CR>
nmap <leader>l :TestLast<CR>
]]
, true)
