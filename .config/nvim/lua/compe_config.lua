local compe = require'compe'

compe.setup {
  enabled = true;

  source = {
    path = true;
    buffer = true;
    vsnip = true;
    ultisnips = true;
    nvim_lsp = false;
  }
}
