# zsh-fzy

zsh-fzy is a [zsh](http://www.zsh.org/) plugin that uses [fzy](https://github.com/jhawthorn/fzy) for 
certain fuzzy matching operations. The plugin defines the following Zle
widgets:

- `fzy-file-widget`: Starts recursive file selection, and inserts the chosen
  file paths in the command line.

- `fzy-cd-widget`: Starts subdirectory selection, and changes to the chosen
  directory with `cd`.

- `fzy-history-widget`: Starts command history selection, using the existing
  input (if any) as initial search query, and replaces the command line with
  the chosen one.


## Installation

It can be installed manually, or by using a plugin manager, e.g.
[zplug](https://github.com/zplug/zplug):

```sh
zplug aperezdc/zsh-fzy
```


## Configuration

By default the widgets defined by the plugin are *not* bound. A typical
configuration could be:

```sh
# ALT-C: cd into the selected directory
# CTRL-T: Place the selected file path in the command line
# CTRL-R: Place the selected command from history in the command line
bindkey '\ec' fzy-cd-widget
bindkey '^T'  fzy-file-widget
bindkey '^R'  fzy-history-widget
```

Additional configuration is done using Zsh styles. The following lists the
available styles and their defaults:

```sh
zstyle :fzy:tmux    enabled      no

zstyle :fzy:history show-scores  no
zstyle :fzy:history lines        ''
zstyle :fzy:history prompt       'history >> '

zstyle :fzy:file    show-scores  no
zstyle :fzy:file    lines        ''
zstyle :fzy:file    prompt       'file >> '

zstyle :fzy:cd      show-scores  no
zstyle :fzy:cd      lines        ''
zstyle :fzy:cd      prompt       'cd >> '
```

Setting `:fzy:tmux enabled` will use a split pane when the shell is running
inside [Tmux](https://github.com/tmux/tmux). Currently there are no options
to allow configuration of the Tmux pane used for the widgets. Contributions
to address this are very welcome, as well as day-to-day testing with this
option enabled.

For each widget, the `:fzy:${widget}` context contains the following options:

- `show-scores`: Whether to let `fzy` show the matching scores for each entry.
- `lines`: The number of lines of the screen to use for the list of candidate
  matches. If undefined, `fzy`'s default is used.
- `prompt`: The prompt shown before the user input.
