require('compe').setup {
  enabled = true;

  source = {
    path = true;
    buffer = true;
    calc = true;
    vsnip = false;
    nvim_lsp = true;
    nvim_lua = true;
    spell = true;
    tags = true;
    ultisnips = false;
    snippets_nvim = false;
    treesitter = true;
  }
}
