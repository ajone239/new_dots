```
 _           ____        _       _____ _ _
| |    ___  |  _ \  ___ | |_    |  ___(_) | ___  ___
| |   / _ \ | | | |/ _ \| __|   | |_  | | |/ _ \/ __|
| |__|  __/ | |_| | (_) | |_    |  _| | | |  __/\__ \
|_____\___| |____/ \___/ \__|___|_|   |_|_|\___||___/
                           |_____|
```

Overview
====================
This is pretty much a copy of my `~/.config/` directory.
It isn't really all that clean, but it has my editor configurations and such.

Install
====================

**NOTE**: Use _Iterm2_ because it auto installs fonts.
That's it, but if you do it before you install everything else it will be magic.

Scripts
--------------------

In this repo, there are a few helper scripts to make this hands off.
No promises that this won't blow up your current config <3.

### `install_scripts/run_all.sh`

This will run all the script.

### `install_scripts/place_rcs.sh`

This will place an rc file for all the configurations supported that don't use XDG.
In essence, these will all have some variation of:
```bash
source $PATH_TO_XDG_DIR/APP_WITHOUT_XDG/RC_FILE
```

### `install_scripts/curl_installs.sh`

Install all the things that need to touch the internet to install:
- Rust
    :)
- Homebrew
    MacOS package manager
- Oh-My-Zsh
    Zsh configuation manager
- Power Level 10k
    Zsh theme

### `install_scripts/brew_install.sh`
Installs all the packages in `brew_packages.txt` using `brew install`.
Run `update_brew_packages` to update the package lock file.

### `install_scripts/cargo_install.sh`
Installs all the packages in `cargo_packages.txt` using `cargo install`.
Run `update_cargo_packages` to update the package lock file.

Terminal Emulator
====================

Iterm2
--------------------
Magic between Iterm2 and p10k will install fonts for you.
This is the only reason I use it.

Terminal Multiplexers
====================

Tmux
--------------------

The OG terminal multiplexer.
The basic rundown of my config:
- "\`" is my leader key so you will do "\`<thing>" to use that key in tmux.
- `<leader>h|l` splits the tab `h`orizontally or vertica`l`ly respectively.
- `<leader>H|L` does the same preserving path.
- `M-<h|j|k|l>` moves focus to the corresponding pane using vim key direction.
- `M-<y|u|i|o>` resizes the focused pane using translated vim key direction.

Zellij
--------------------

What I use now.
It is a terminal multiplexer with batteries included.
I use the default config is that is a good enough vote of confidence for you.
[Here](https://zellij.dev) is more info.

Editors
====================

NeoVim
--------------------
NeoVim is the main editor I use.
I use it chiefly ~cuz~ it's the best.
The current config should auto install the first time you open it.

Vim
--------------------
The rc for vim is at `~/.config/vim/vimrc`.
The rc that is in `$HOME` just sources this.


Doom-Emacs
--------------------
Gross I know.
Org mode is so nice though.
To set this up:
- Install emacs
- run the following to get the `doom` bin.

```
git clone https://github.com/hlissner/doom-emacs ~/.emacs.d
~/.emacs.d/bin/doom sync
```
- Only a sync is needed because the Doom configuration files are here.
