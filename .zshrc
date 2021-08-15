[[ -f ~/Git/zsh-snap/znap.zsh ]] ||
    git clone https://github.com/marlonrichert/zsh-snap.git ~/Git/zsh-snap

source ~/Git/zsh-snap/znap.zsh  

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

znap source "marlonrichert/zsh-autocomplete"
znap compdef _cargo   'rustup  completions zsh cargo'
znap compdef _rustup  'rustup  completions zsh'
ZSH_AUTOSUGGEST_STRATEGY=( history )
znap source zsh-users/zsh-autosuggestions
ZSH_HIGHLIGHT_HIGHLIGHTERS=( main brackets )
znap source zsh-users/zsh-syntax-highlighting
znap source ohmyzsh/ohmyzsh plugins/docker-compose
znap source marlonrichert/zcolors
znap eval zcolors "zcolors ${(q)LS_COLORS}"

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
