Dotfiles managed with GNU Stow.

$ cd ~/dotfiles
$ stow --dotfiles .

`--dotfiles` flag replaces 'dot-' prefix with '.'.

By default stow uses parent of "stow directory" as its "target directory".
"target directory" must be user's home for dotfiles to work.
