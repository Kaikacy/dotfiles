# Dotfiles
managed with gnu stow
using really cool flag `--dotfiles`
which replaces `dot-` prefix on files and dirs with `.`

# Usage
just run `stow --dotfiles .` in root directory.
by default stow uses parent of stow directory as target
so dotfiles should be in `$HOME` or target should be specified
