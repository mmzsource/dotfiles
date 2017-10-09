# Goal

Attempt to organise my dotfiles and keep them in sync over multiple
computers.

# Usage

- Clone this repo wherever you like (I use `~/.dotfiles`)
- Install [GNU stow][] (I use `brew install stow`) 
- Run the `install.sh` script. 

That'll set up a bunch of symlinks in your home directory, e.g.,
`.stowtest` -> `.dotfiles/stowtest/.stowtest`

It won't overwrite existing files, so move those out of the way
first.

# Credits

Mostly inspired by / copied from [hrs/dotfiles][].

# Licence

Use everything in this repo however you want it at your own risk.

[GNU stow]: https://www.gnu.org/software/stow/
[hrs/dotfiles]: https://github.com/hrs/dotfiles
