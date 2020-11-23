local fn = vim.fn
local U = {}

function table.merge(dest, src)
   for k,v in pairs(src) do
       dest[k] = v
   end

   return dest
end

-- Key mapping
function U.map(mode, key, result, opts)
    opts = table.merge({
        noremap = true,
        silent = true,
        expr = false
    }, opts or {})

    fn.nvim_set_keymap(mode, key, result, opts)
end

return U
