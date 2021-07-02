NPM_PACKAGES=(
  bash-language-server
  diagnostic-languageserver
  emmet-ls
  typescript-language-server
  vscode-css-languageserver-bin
  vscode-html-languageserver-bin
  vscode-json-languageserver
)

GO_PACKAGES=(
  "github.com/mattn/efm-langserver"
)

echo "installing packages..."
yarn global add ${NPM_PACKAGES[@]}
go get ${GO_PACKAGES[@]}

# Install sumneko lua
if [ "$SYSTEM_TYPE" = "Darwin" ]; then
  brew install saadparwaiz1/personal/lua-language-server
fi
