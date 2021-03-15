# TODO: add sumneko

NPM_PACKAGES=(
  "diagnostic-languageserver"
  "typescript-language-server"
  "vscode-json-languageserver"
  "vscode-css-languageserver-bin"
  "vscode-html-languageserver-bin"
  "bash-language-server"
  "typescript"
  "eslint"
  "prettier"
)

GO_PACKAGES=(
  "github.com/mattn/efm-langserver"
)

RUBY_PACKAGES=(
  "solargraph"
  "rubocop"
)

echo "installing packages..."
yarn global add ${NPM_PACKAGES[@]}
go get ${GO_PACKAGES[@]}
# gem install $--user-install {RUBY_PACKAGES[@]}
