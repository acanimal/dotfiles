# dotfiles

> These are my dotfiles. If you don’t like them I have others.

I followed the technique found at <https://www.atlassian.com/git/tutorials/dotfiles> which is a more extensive explanation of the original found at HN <https://news.ycombinator.com/item?id=11070797>

---

## Install this dotfiles repository onto a new system or migrate to this setup

In your $HOME folder, add the next alias to shell config (`.bashrc`, `.zshrc`, ...)

> We are using `.dotfiles` as a bare git repository to track file changes

```bash
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
```

Ignore our dotfiles repository

```bash
echo ".dotfiles" >> .gitignore
```

Clone this dotfiles remote repository into a bare repository in a "dot" folder of your $HOME:

```bash
git clone --bare <this-git-repo-url> $HOME/.dotfiles
```

Define the alias in the current shell scope:

```bash
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
```

Checkout the actual content from the bare repository to your $HOME:

```bash
dotfiles checkout
```

The step above might fail with a message like:

```bash
error: The following untracked working tree files would be overwritten by checkout:
    .zshrc
    .gitignore
Please move or remove them before you can switch branches.
Aborting
```

If that is your case just remove or backup the files (renaming them) and try again.

Set the flag `showUntrackedFiles` to no on this specific (local) repository to hide files we are not explicitly tracking yet. This is so that when you type `dotfiles status` and other commands later, files you are not interested in tracking will not show up as untracked.

```bash
dotfiles config --local status.showUntrackedFiles no
```
