

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

### 1. Repository klonen
```bash
git clone git@github.com:<dein-github-name>/dotfiles.git ~/dotfiles
cd ~/dotfiles



stow zsh tmux ohmytmux nvim ssh wezterm starship



git add .
git commit -m "update: zshrc / tmux config"
git push

2. Pakete stowen
Nur die Pakete auswählen, die du brauchst:
stow zsh tmux ohmytmux nvim ssh wezterm starship
3. Fertig 🎉
Die Dotfiles sind jetzt als Symlinks in deinem $HOME verfügbar.
Änderungen synchronisieren
Dateien im Repo anpassen (egal ob über den Symlink wie ~/.zshrc oder direkt im Repo).
Änderungen committen:
git add .
git commit -m "update: zshrc / tmux config"
git push
Auf anderen Geräten einfach git pull + stow ausführen, um alles zu aktualisieren.
Tipps
Mit stow -D paketname kannst du ein Paket wieder „unstowen“ (Symlinks entfernen).
Änderungen sollten immer im Repo landen → dann bleiben sie versionskontrolliert.

---

👉 Willst du, dass ich dir auch noch den **Bootstrap-Einzeiler** in die README einbaue (für neue
