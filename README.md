# Dotfiles mit GNU Stow

Meine persönliche Dotfiles-Repo-Struktur.  
Verwaltet mit [GNU Stow](https://www.gnu.org/software/stow/) und GitHub.

## Struktur
Jedes Unterverzeichnis ist ein „Paket“:
- `zsh/.zshrc`
- `tmux/.tmux.conf`
- `ohmytmux/.tmux.conf.local`
- `nvim/.config/nvim/…`
- `ssh/.ssh/config`
- `wezterm/.wezterm.lua`
- `starship/.config/starship.toml`

Stow sorgt dafür, dass im `$HOME` die passenden Symlinks gesetzt werden.

---

## Installation auf einem neuen Gerät

### 1. Bootstrap-Einzeiler
```bash
git clone https://github.com/dennis605/dotfiles.git ~/dotfiles \
  && cd ~/dotfiles \
  && stow zsh tmux ohmytmux nvim ssh wezterm starship




git clone https://github.com/dennis605/dotfiles.git ~/dotfiles
cd ~/dotfiles
stow zsh tmux




