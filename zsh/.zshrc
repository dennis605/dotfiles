# ---------- PATH & Basics ----------
# Homebrew Prefix robust ermitteln (Apple Silicon zuerst)
if command -v brew >/dev/null 2>&1; then
  BREW_PREFIX="$(brew --prefix 2>/dev/null)"
else
  BREW_PREFIX="/opt/homebrew"
fi

# Eigene Pfade
export PATH="/opt/homebrew/opt/ssh-copy-id/bin:$PATH"
export PATH="$HOME/flutter/flutter/bin:$PATH"
export PATH="/opt/homebrew:$PATH"
export PATH="$HOME/.gem/bin:$PATH"
export PATH="$PATH:$HOME/Library/Developer/Xamarin/android-sdk-macosx/cmdline-tools/7.0/bin"

# ---------- Completion System (muss vor compdef-Aufrufen stehen) ----------
autoload -Uz compinit
# Schnellstart: nutze Cache, baue nur neu wenn nötig
if [[ ! -f ~/.zcompdump ]] || [[ ~/.zcompdump -nt ~/.zshrc ]]; then
  compinit
else
  compinit -C
fi

# ---------- Conda (automatisch von conda init verwaltet) ----------
# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/dennisschonig/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/dennisschonig/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/dennisschonig/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/dennisschonig/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

# ---------- Tools / Bootstrap ----------
# Fabric (nur wenn vorhanden)
[[ -f "$HOME/.config/fabric/fabric-bootstrap.inc" ]] && . "$HOME/.config/fabric/fabric-bootstrap.inc"

# FZF (optional, nur laden wenn installiert)
[[ -f "$HOME/.fzf.zsh" ]] && . "$HOME/.fzf.zsh"
# FZF Vorschau via bat
export FZF_CTRL_T_OPTS="
  --walker-skip .git,node_modules,target
  --preview 'bat -n --color=always {}'
  --bind 'ctrl-/:change-preview-window(down|hidden|)'"

# Angular CLI Completion (nur wenn ng existiert)
if command -v ng >/dev/null 2>&1; then
  # Angular liefert zsh-kompatible Completion -> nach compinit laden
  source <(ng completion script)
fi

# NVM (zsh-freundlich; kein bash_completion!)
export NVM_DIR="$HOME/.nvm"
[[ -s "/opt/homebrew/opt/nvm/nvm.sh" ]] && . "/opt/homebrew/opt/nvm/nvm.sh"

# ---------- zsh-Plugins ----------
# Autosuggestions
if [[ -r "$BREW_PREFIX/share/zsh-autosuggestions/zsh-autosuggestions.zsh" ]]; then
  source "$BREW_PREFIX/share/zsh-autosuggestions/zsh-autosuggestions.zsh"
  # Optional: dezente Farbe
  : ${ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE:=fg=8}
fi

# Syntax Highlighting (IMMER nach autosuggestions laden)
if [[ -r "$BREW_PREFIX/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" ]]; then
  source "$BREW_PREFIX/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
  # Unterstreichung deaktivieren
  (( ${+ZSH_HIGHLIGHT_STYLES} )) || typeset -A ZSH_HIGHLIGHT_STYLES
  ZSH_HIGHLIGHT_STYLES[path]=none
  ZSH_HIGHLIGHT_STYLES[path_prefix]=none
fi

# ---------- Terminal-spezifisches ----------
if [[ "$TERM_PROGRAM" == "ghostty" ]]; then
  export TERM=xterm-256color
fi

# ---------- Aliases ----------
alias eza="eza --icons"
alias ll='ls -lh'
alias la='ls -lah'

# ---------- Starship Prompt (zuletzt, überschreibt Prompt clean) ----------
eval "$(starship init zsh)"

