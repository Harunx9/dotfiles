#LINUX
export ZPLUG_HOME=~/.zplug/
#macOS
#export ZPLUG_HOME=/usr/local/opt/zplug
source $ZPLUG_HOME/init.zsh

zstyle ':completion:*' menu select
export NeovideMultiGrid

export VSCODE_GALLERY_SERVICE_URL='https://marketplace.visualstudio.com/_apis/public/gallery'
export VSCODE_GALLERY_CACHE_URL='https://vscode.blob.core.windows.net/gallery/index'
export VSCODE_GALLERY_ITEM_URL='https://marketplace.visualstudio.com/items'
export VSCODE_GALLERY_CONTROL_URL=''
export VSCODE_GALLERY_RECOMMENDATIONS_URL=''

export PYTHON=python3
export GDK_SCALE=1
export GDK_DPI_SCALE=0.5
zplug "marlonrichert/zsh-autocomplete"

zplug load --verbose

#aliases
alias ls=lsd
alias la="ls -al"
alias ll="ls -l"
alias ..="cd .."

# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH

export PATH=/usr/share/dotnet:$PATH
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
