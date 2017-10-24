# zsh-fzy

zsh-fzy is a [zsh](http://www.zsh.org/) plugin that uses [fzy](https://github.com/jhawthorn/fzy) for 
certain fuzzy matching operations.

It can be installed manually, or by using a plugin manager, eg [zplug](https://github.com/zplug/zplug):

```
zplug "aperezdc/zsh-fzy"
```

## Configuration

Flags for fzy can be set in your `~/.zshrc` thus:

```
ZSH_FZY_FLAGS=( -l 25 -s -j 4 )
  
# See fzy help for all available flags

```
