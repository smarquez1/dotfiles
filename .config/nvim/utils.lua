local fn = vim.fn
local U = {}

function table.merge(dest, src)
   for k,v in pairs(src) do
       dest[k] = v
   end

   return dest
end

-- Key mapping
function U.map(mode, lhs, rhs, opts)
  local options = {noremap = true}
  if opts then options = vim.tbl_extend('force', options, opts) end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

function U.opt(scope, key, value)
  scopes[scope][key] = value
  if scope ~= 'o' then scopes['o'][key] = value end
end

return U
