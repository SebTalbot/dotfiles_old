# Install to another system


`git clone --bare git@github.com:SebTalbot94/dotfiles.git $HOME/.dotfiles`

`alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'`

`config checkout`
