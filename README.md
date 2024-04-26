# Dotfiles

This repository contains my personal dotfiles. They are managed using [GNU Stow](https://www.gnu.org/software/stow/), a free, portable, lightweight symlink farm manager. This allows the dotfiles to be organized in a clean manner.

## Prerequisites

- [GNU Stow](https://www.gnu.org/software/stow/)

## Installation

Clone this repository into your home directory.

```bash
git clone https://github.com/mooteee/dotfiles.git ~/.dotfiles
```

Navigate to the dotfiles directory.

```bash
cd ~/.dotfiles
```

To install the package, you need to run the `install_package.sh` script. This script is responsible for setting up the necessary environment and installing the required packages for your dotfiles. Run the following command:

```bash
./install_package.sh
```

Use `stow` to symlink the dotfiles to your home directory. For example, to apply the zsh configuration, you would type:

```bash
stow zsh
```

For add all the configurations, you can use the following command:

```bash
stow */
```

## Uninstallation

To remove the symlinks, navigate to your dotfiles directory and use the `-D` option with `stow`:

```bash
stow -D zsh
```

To remove all the symlinks, you can use the following command:

```bash
stow -D */
```

## More Information

For more information on how to use `stow`, refer to the [GNU Stow manual](https://www.gnu.org/software/stow/manual/stow.html).

How use `stow` for [manage dotifles](https://alexpearce.me/2016/02/managing-dotfiles-with-stow/)

[Cheat Sheet](https://cht.sh/stow) for `stow`

## Contributing

If you have suggestions for improving my dotfiles, please open an issue or submit a pull request.

## License

These dotfiles are licensed under the GPL3 License - see the [LICENSE.txt](LICENSE.txt) file for details.
