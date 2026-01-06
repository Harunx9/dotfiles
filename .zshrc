fastfetch

[[ -f ~/Git/zsh-snap/znap.zsh ]] ||
    git clone --depth 1 -- \
        https://github.com/marlonrichert/zsh-snap.git ~/Git/zsh-snap

source ~/Git/zsh-snap/znap.zsh

zstyle ':completion:*' menu select

export LS_COLORS="$(vivid generate one-dark)"
export XCURSOR_SIZE=32

znap source marlonrichert/zsh-autocomplete
znap fpath _cargo   'rustup  completions zsh cargo'
znap fpath _rustup  'rustup  completions zsh'
ZSH_AUTOSUGGEST_STRATEGY=( history )
znap source zsh-users/zsh-autosuggestions
ZSH_HIGHLIGHT_HIGHLIGHTERS=( main brackets )
znap source zsh-users/zsh-syntax-highlighting
znap source ohmyzsh/ohmyzsh plugins/docker-compose

#aliases
alias ls=lsd
alias la="ls -al"
alias ll="ls -l"
alias ..="cd .."

eval "$(starship init zsh)"



# fnm
FNM_PATH="/home/harun/.local/share/fnm"
if [ -d "$FNM_PATH" ]; then
  export PATH="$FNM_PATH:$PATH"
  eval "`fnm env`"
fi
