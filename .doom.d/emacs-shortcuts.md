# Emacs Shortcuts

## Help

| Shortcut              | Command Invoked                  | Description                                                        |
|-----------------------|----------------------------------|--------------------------------------------------------------------|
| `C-h m`               | `describe-mode`                  | Help information for the current buffers modes                     |
| `C-h f`               | `describe-function`              | Help information for a function                                    |
| `C-h x`               | `describe-command`               | Help information for a command (a function available using `M-x`)  |
| `C-h k`               | `describe-key`                   | Describe the Emacs command that a keyboard sequence invokes        |
| `C-h l`               | `view-lossage`                   | Show log for key presses and commands                              |
| `C-h b`               | `describe-bindings`              | List all of the key bindings for the current buffer                |

## Buffers

| Shortcut              | Command Invoked                  | Description                                                        |
|-----------------------|----------------------------------|--------------------------------------------------------------------|
| `C-x C-c`             | `save-buffers-kill-terminal`     | Quit Emacs                                                         |
| `C-x s`               | `save-some-buffers`              | Save all buffers                                                   |
| `C-x C-s`             | `save-buffer`                    | Save current buffer                                                |
| `C-x C-w`             | `write-file`                     | Write the current buffer, can provide new file name                |
| `C-x b`               | `switch-to-buffer `              | Move to the specified buffer                                       |
| `C-x C-b`             | `list-buffers`                   | Display the list of currently active buffers                       |
| `C-x k`               | `kill-buffer`                    | Kill the current buffer                                            |

## Edit

| Shortcut              | Command Invoked                  | Description                                                        |
|-----------------------|----------------------------------|--------------------------------------------------------------------|
| `C-/`                 | `undo`                           | Undo                                                               |
| `C-g C-/`             | `undo-redo`                      | Redo                                                               |
| `C-y`                 | `yank`                           | Yank from kill ring                                                |
| `M-y`                 | `yank-pop`                       | Yank down the kill ring                                            |
| `C-x SPC`             | `rectangle-mark-mode`            | Rectangle edit mode, can use string-insert-rectangle               |
| `C-x h`               | `mark-whole-buffer`              | Highlight entire buffer                                            |


## Navigation

| Shortcut              | Command Invoked                  | Description                                                        |
|-----------------------|----------------------------------|--------------------------------------------------------------------|
| `C-a`                 | `move-beginning-of-line`         | Move cursor to the beginning of the line                           |
| `C-e`                 | `move-end-of-line`               | Move cursor to the end of the line                                 |
| `M-a`                 | `backward-sentence`              | Move cursor to the beginning of the sentence                       |
| `M-e`                 | `forward-sentence`               | Move cursor to the end of the sentence                             |
| `M-{`                 | `backward-paragraph`             | Previous paragraph                                                 |
| `M-}`                 | `forward-paragraph`              | Next paragraph                                                     |
| `M-v`                 | `scroll-down-command`            | Page up                                                            |
| `C-v`                 | `scroll-up-command`              | Page down                                                          |
| `M-<`                 | `beginning-of-buffer`            | Go to start of file                                                |
| `M->`                 | `end-of-buffer`                  | Go to end of file                                                  |

## Windows

| Shortcut              | Command Invoked                  | Description                                                        |
|-----------------------|----------------------------------|--------------------------------------------------------------------|
| C-x 0                 | delete-window                    | Delete the current window                                          |
| C-x 1                 | delete-other-windows             | Delete all the windows except this one                             |
| C-x 2                 | split-window-horizontally        | Divide the current window horizontally in two                      |
| C-x 5                 | split-windws-vertically          | Divide the current window vertically in two                        |
| C-x >                 | scroll-right                     | Scroll the window right                                            |
| C-x <                 | scroll-left                      | Scroll the window left                                             |
| C-x +                 | balance-windows                  | Resize all splits to equal sizes                                   |
| C-x ^                 | enlarge-window                   | Make the current window taller                                     |
| C-x }                 | enlarge-window-horizontally      | Make the window wider                                              |
| C-x {                 | shrink-window-horizontally       | Make the window less wide                                          |
| M-C-v                 | scroll-other-window              | Scroll the other window                                            |
| C-x o                 | other-window                     | Select another window (letter “o”, not number 0)                   |
