# DOOM EMACS CONFIG ARCH LINUX

# IMAGES

## Literate Config
Found in: [config.org](./config.org)

# Install Emacs
On Arch I use [Emacs Wayland](https://archlinux.org/packages/extra/x86_64/emacs-wayland/) version.

``` bash
yay -S emacs-wayland
```

## Pre-requisites

- **Fonts**

I use JetBrains font, Ubuntu font and Cantarell font

You can install the fonts using the package manager:

``` bash
yay -S ttf-jetbrains-mono-nerd
yay -S ttf-ubuntu-font-family
yay -S cantarell-fonts 
```

You can download also the JetBrains font here: [JetBrains Mono Font](https://www.jetbrains.com/lp/mono/)

Install the Ubuntu fonts from here: [Ubuntu Fonts](https://design.ubuntu.com/font)
> [!NOTE]
> The variable pitch font for `org-mode` files use Cantarall font. Should be installed by default on distros like Ubuntu and Pop!_OS. If not, please download and install this font as well.

- **Install lldb**

``` bash
yay -S lldb
yay -S lldb-mi
```
This will prompt and install. Do the same for `git`

- **Install base-devel and git**

``` bash
yay -S git
yay -S base-devel
```

- **Install git-secrets**

``` bash
yay -S git-secrets
```

- **Install git-extras**

``` bash
yay -S git-extras
```

-**Install dbus**

``` bash
yay -S dbus
```

- **Install npm and nodejs**
Required to make copilot work

``` bash
yay -S  npm
yay -S  nodejs
```

- **Install Maccy**

- **Install `cmake`**

Needed to compile vterm

``` bash
yay -S cmake
```

- **Install pip**

``` bash
yay -S python-pip
```

- **Install Pyright LSP Server**

``` bash
yay -S pyright
```

- **C-Library to increase magit speed**

``` bash
yay -S libgit2
```

- **GNU file, shell and text utilities**

``` bash
yay -S coreutils
```

- **Install TexLive**

``` bash
yay -S texlive
```

- **CCLS**

``` bash
yay -S ccls
```

- **Install Rust and `rust-analyzer`**

Install rust by following the official website: [Install Rust](https://www.rust-lang.org/tools/install)

And now install `rust-analyzer`

``` bash
rustup componet add rust-analyzer
```

If you want to update components added from `rustup`, run:

``` bash
rustup update
```

- **Install `texlab` LSP Server**

``` bash
yay -S texlab
```

Installation instructions: [texlab GitHub](https://github.com/latex-lsp/texlab)

- **Install GDB**

`gdb` is used for Rust and C/C++ debugging.

``` bash
yay -S gdb
```

 - **Install `graphviz`**

This is needed for `org-roam` to generate graph visualisations.

``` bash
yay -S graphviz
```

- **Install `ripgrep`**

``` bash
yay -S ripgrep
```

- **Install X11 Clipboard**

``` bash
yay -S xclip
```

- **Install glslang-tools**

``` bash
yay -S glslang
```

- **Install libtool**

``` bash
yay -S libtool
```

- **Install aspell**

``` bash
yay -S aspell
yay -S aspell-en
```

- **Install fd**

``` bash
yay -S fd
```

- **imagemagick**

``` bash
yay -S imagemagick
```

- **dvisvgm and dvipng**

``` bash
yay -S dvisvgm
yay -S dvipng
```

Or build from source: [Script download here](https://gist.github.com/tobywf/aeeeee63053aaaa841b4032963406684)

- **Install pyenv**

``` bash
yay -S pyenv
```

- **Install pipvenv**

``` bash
yay -S python-pipvenv
```

- **Install pytest**

``` bash
yay -S python-pytest
```

- **Install cpptest**

``` bash
yay -S cpptest
```

- **Install python-json5**

``` bash
yay -S python-json5
yay -S yq
```

## Installation

1. First install Emacs. Latest version is recommended. Use the instructions above
2. Install Doom Emacs:

``` bash
git clone --depth 1 https://github.com/doomemacs/doomemacs ~/.config/emacs
~/.config/emacs/bin/doom install
```
More details about Doom Emacs can be found in the GitHub page: [Doom Emacs GitHub](https://github.com/doomemacs/doomemacs)

Run `doom sync` after installing Doom Emacs.
Rm `doom env` after installing Doom Emacs

3. Download the repo and copy the contents of this repo to the directory: `~/.config/doom`
4. Run `doom sync` command after copying the contents.
5. Create a folder `+STORE` in your home directory
6. Add `export PATH="$HOME/.config/emacs/bin/:$PATH"` to your `~/.zshrc` or `~/.bashrc`
7. Run `doom doctor` and install any software you need/want to

## Post Install

- In Emacs, run:
  - `M-x all-the-icons-install-fonts`
  - `M-x nerd-icons-install-fonts`
  - `M-x dap-cpp-tools-setup`
  - `M-x dap-codelldb-setup`
  - `M-x copilot-install-server`

- `M-x treesit-install-language-grammar`
- `M-x customize-group` and change elcord to use `ts-mode` to have the correct Discord rich presence icon.
## TODO
- Update README Images
- GitHub Copilot
