#LINUX
export ZPLUG_HOME=~/.zplug/
#macOS
#export ZPLUG_HOME=/usr/local/opt/zplug
source $ZPLUG_HOME/init.zsh

zstyle ':completion:*' menu select

export PYTHON=python3
export GDK_SCALE=1
export GDK_DPI_SCALE=0.5

zplug "plugins/git", from:oh-my-zsh
zplug "plugins/brew", from:oh-my-zsh
zplug "plugins/cargo", from:oh-my-zsh
zplug "plugins/docker", from:oh-my-zsh
zplug "plugins/dotnet", from:oh-my-zsh
zplug "plugins/osx", from:oh-my-zsh

zplug load --verbose

#aliases
alias la="ls -alG"
alias ll="ls -lG"
alias ls="ls -G"
alias ..="cd .."

# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH

# fnm
export PATH=~/.fnm:$PATH
eval "`fnm env`"

#git 
export PATH=$PATH:/usr/local/bin

#cargo
export PATH=$PATH:$HOME/.cargo/env
export PATH=$PATH:$HOME/.cargo/bin

eval "$(starship init zsh)"

# fnm
export PATH=/home/szymon/.fnm:$PATH
eval "`fnm env`"

# fnm
export PATH=/home/harunx9/.fnm:$PATH
eval "`fnm env`"
