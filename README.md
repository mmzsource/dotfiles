# Goals

- Organise and version my personal dotfiles
- Keep them in sync over multiple computers

# Usage

- Clone this repo wherever you like (e.g. `~/.dotfiles`)
- Install [GNU stow][] (e.g. `brew install stow`) 
- Run the `install.sh` script

That'll set up a bunch of symlinks in your home directory (e.g.
`~/.stowtest` -> `~/.dotfiles/stowtest/.stowtest`)

It won't overwrite existing files, so move those out of the way
first.

# Credits

Mostly inspired by / copied from [hrs/dotfiles][].

[GNU stow]: https://www.gnu.org/software/stow/
[hrs/dotfiles]: https://github.com/hrs/dotfiles
