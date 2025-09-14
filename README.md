Dotfiles mit GNU Stow

Dieses Repository enthält meine persönlichen Dotfiles.
Verwaltet werden sie mit GNU Stow und GitHub.
Ziel: einheitliche Konfiguration auf allen Geräten.

------------------------------------------------------------
Struktur

Jedes Unterverzeichnis ist ein Paket, das per Stow in das Home-Verzeichnis verlinkt wird:

- zsh -> ~/.zshrc
- tmux -> ~/.tmux.conf
- ohmytmux -> ~/.tmux.conf.local
- nvim -> ~/.config/nvim
- ssh -> ~/.ssh/config
- wezterm -> ~/.wezterm.lua
- starship -> ~/.config/starship.toml

------------------------------------------------------------
Installation auf neuem Gerät

Bootstrap-Einzeiler (alle Pakete):
git clone https://github.com/dennis605/dotfiles.git ~/dotfiles   && cd ~/dotfiles   && stow zsh tmux ohmytmux nvim ssh wezterm starship

Nur bestimmte Pakete:
git clone https://github.com/dennis605/dotfiles.git ~/dotfiles
cd ~/dotfiles
stow zsh tmux

------------------------------------------------------------
Änderungen synchronisieren

Änderungen machen:
- Direkt im Repo (~/dotfiles/…)
- oder über Symlinks (~/.zshrc, ~/.tmux.conf usw.)

Änderungen committen und pushen:
cd ~/dotfiles
git add .
git commit -m "update: <Beschreibung>"
git push

Auf einem anderen Gerät aktualisieren:
cd ~/dotfiles
git pull
stow -R zsh tmux ohmytmux nvim ssh wezterm starship

------------------------------------------------------------
Typische Workflows

Neues Paket hinzufügen:
mkdir -p ~/dotfiles/alacritty/.config/alacritty
cp ~/.config/alacritty/alacritty.yml ~/dotfiles/alacritty/.config/alacritty/
cd ~/dotfiles
stow alacritty
git add .
git commit -m "add alacritty config"
git push

Paket entfernen:
cd ~/dotfiles
stow -D wezterm       # Symlinks entfernen
rm -rf wezterm        # Repo-Ordner löschen
git commit -am "remove wezterm config"
git push

Änderungen rückgängig machen:
git checkout -- zsh/.zshrc

Backup vor riskanten Änderungen:
cp ~/.zshrc ~/.zshrc.backup

Repo aufräumen oder prüfen:
git status
git diff

------------------------------------------------------------
Troubleshooting

Fehler "stow would cause conflicts":
Alte Symlinks oder echte Dateien liegen im Weg.
Lösung:
rm ~/.zshrc ~/.tmux.conf ~/.ssh/config   # nur wenn Symlink oder Duplikat
stow zsh tmux ssh

Fehler "No such file or directory":
Datei existiert nicht. Prüfen, ob sie lokal vorhanden oder noch zu erstellen ist.

Editor überschreibt Symlink:
Normalerweise schreibt der Editor in die Ziel-Datei.
Falls ein Link ersetzt wird: einfach stow paket neu ausführen.

------------------------------------------------------------
Tipps & Tricks

Pakete testen (dry-run):
stow -n -v zsh

Nur bestimmte Pakete stowen:
stow zsh tmux

Paket neu stowen (refresh):
stow -R nvim

Logs durchsuchen:
git log -p zsh/.zshrc

Optional: Alias in .zshrc für häufige Workflows:
alias dotp="cd ~/dotfiles && git pull && stow -R zsh tmux ohmytmux nvim ssh wezterm starship"
alias dots="cd ~/dotfiles && git add . && git commit -m 'update' && git push"

------------------------------------------------------------
Verwendete Tools

- GNU Stow – Symlink-Manager
- Git & GitHub – Versionskontrolle & Synchronisation
- Mackup (historisch) – wurde früher genutzt, jetzt ersetzt durch Stow

------------------------------------------------------------
Sicherheitshinweis

Bearbeiten immer im Repo oder über den Symlink.
Falls ein Symlink versehentlich überschrieben wird, bleibt die Datei im Repo erhalten.
Den Symlink einfach mit stow paket neu erstellen.

