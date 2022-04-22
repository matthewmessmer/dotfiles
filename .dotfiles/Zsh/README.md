
Zsh
===

## Installation

### Install [oh-my-zsh](http://ohmyz.sh/)

```bash
curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh
```

### Symlink private files from Dropbox:

```
rm ~/.zsh_history && ln -s ~/Dropbox/System/.zsh_history ~/.zsh_history
```


## Manage Plugin/Theme [Subtrees][subtrees]

Use custom function to manage scripts:

```bash
# add/update a plugin
zsh-custom add plugin <PLUGIN_GIT_URL>
zsh-custom update plugin <PLUGIN_GIT_URL>

# add/update a theme
zsh-custom add theme <THEME_GIT_URL>
zsh-custom update theme <THEME_GIT_URL>

# update with yadm
yadm submodule update --init --recursive
```

[subtrees]: https://www.atlassian.com/blog/git/alternatives-to-git-submodule-git-subtree


https://github.com/pwyde/dotfiles
https://htr3n.github.io/2018/07/faster-zsh/
https://github.com/htr3n/zsh-config