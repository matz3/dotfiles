# dotfiles

Your dotfiles are how you personalize your system. These are mine.

## Topics

Everything's built around topic areas. If you're adding a new area to your
forked dotfiles — say, "Java" — you can simply add a `java` directory and put
files in there. Anything with an extension of `.zsh` is meant to be included from your [`.zshrc`](./zsh/zshrc.symlink). Anything with an extension of `.sh` is meant to be called from other scripts (e.g. within the [`bin`](./bin/) folder) or just executed manually.
Anything with an extension of `.symlink` will get
symlinked without extension into `$HOME` when you run [`bootstrap.sh`](./bootstrap.sh).

## Install

Run this:

```sh
git clone <git-url> ~/.dotfiles
cd ~/.dotfiles
./bootstrap.sh
```

This will symlink the appropriate files in `.dotfiles` to your home directory.
Everything is configured and tweaked within `~/.dotfiles`.

## Credits

Started as fork of [holman's dotfiles](https://github.com/holman/dotfiles) but removed a lot of magic in [`zsh/zshrc.symlink`](./zsh/zshrc.symlink) to just manually source other `zsh` files. Also removed the `install` script and moved `bootstrap` into the root folder.

[OS X settings](./macos/settings.sh) are based on [mathiasbynens' dotfiles](https://github.com/mathiasbynens/dotfiles/blob/master/.macos).
