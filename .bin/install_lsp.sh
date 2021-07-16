NPM_PACKAGES=(
  bash-language-server
  diagnostic-languageserver
  emmet-ls
  stylelint-lsp
  typescript-language-server
  vscode-html-languageserver-bin # html, css, json
)

GO_PACKAGES=(
  "github.com/mattn/efm-langserver"
)

echo "installing packages..."
yarn global add ${NPM_PACKAGES[@]}
asdf reshim nodejs
go get ${GO_PACKAGES[@]}

# Install sumneko lua
if [ "$SYSTEM_TYPE" = "Darwin" ]; then
  brew install saadparwaiz1/personal/lua-language-server
fi
