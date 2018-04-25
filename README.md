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


Additional command line flags for `fzy` can be set using the `ZSH_FZY_FLAGS`
array:

```sh
ZSH_FZY_FLAGS=( -l 25 -s -j 4 )
  
# See fzy help for all available flags

```
