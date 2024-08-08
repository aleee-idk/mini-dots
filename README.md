# Personal Dotfiles :3

## Installation

Please ensure the that git is installed and you have an ssh key registered,
then execute the following command:

```bash
sh -c "$(curl -fsLS get.chezmoi.io)" -- -b $HOME/.local/bin init --promptBool 'keep chezmoi?=false' --apply aleee-idk/mini-dots
```

To set up the dotfiles and then delete all traces of the manager, run:

```bash
sh -c "$(curl -fsLS get.chezmoi.io)" -- -b $HOME/.local/bin init --promptBool 'keep chezmoi?=false' --one-shot aleee-idk/mini-dots
```
