Bash is a Unix shell and command language written by Brian Fox for the GNU Project as a free software replacement for the Bourne shell.

Bash alternative is [zsh](http://www.zsh.org/).

# History

The bash program, has a history file, usualy `$HOME/.bash_history`, and control the
size of this file (memory of commands). To don't limit the size of his history
file, set the variables bellow to [bashrc](.bashrc).

```
export HISTFILESIZE=
export HISTSIZE=
```

To avoid save duplicated commands and repeated commands. Use history control
with **ignoreboth** and **erasedups**. Add in [bashrc](.bashrc)

```
export HISTCONTROL=ignoreboth:erasedups
```

# PS1

PS1 is the primary prompt which is displayed before each command [ref](https://wiki.archlinux.org/index.php/Bash/Prompt_customization)

It has the dependency of script [bash utils](.bash_utils).

Add in [bashrc](.bashrc) to use.

```
export PS1="$DEFAULT\w$NONE \$(_env) \$(_git) \n\$ "
```

# Base alias

Bash alias is a keyboard shortcut, abbreviations to a long command sequence.

The source file is in [bash alias](.bash_alias).

* g: git
* py: python
* ipy: ipython
* jn: jupyter notebook
* ojn: jupyter notebook with gpu start
* sdocker: docker system service startup
* sd: docker
* sdc: docker compose

# Bash utils

The script [bash utils](.bash_utils) has some utils functions to bash:

* se and searchenvdir: search for a virtual env from / to current dir
* extract: base function to extract data from some compressed files
* _battery: get the current baterry status to print in PS1
* _git: get current branch to print in PS1
* _env: get .pyenv name to print in PS1
* calc: command line calculator using python or awk. To use '()' is necessary quotations ""
