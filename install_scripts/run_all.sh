#!/zsh/bin

$HOME/.config/install_scripts/place_rcs.sh

source $HOME/.zshrc

$HOME/.config/install_scripts/curl_installs.sh

source $HOME/.zshrc

$HOME/.config/install_scripts/brew_install.sh
$HOME/.config/install_scripts/cargo_install.sh
