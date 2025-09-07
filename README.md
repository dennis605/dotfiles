# Mein Dotfiles-Setup

Dieses Repository verwaltet meine plattformübergreifende Entwicklungsumgebung mit `yadm`.

---

### 🚀 Ein neues System einrichten

1.  **Voraussetzungen installieren:**
    *   **macOS:** `brew install git yadm`
    *   **Linux (Debian/Ubuntu):** `sudo apt update && sudo apt install git yadm`

2.  **Repository klonen & Bootstrap ausführen:**
    *   Ersetze `DEIN-REPO-URL` durch die SSH-URL von GitHub.
    *   `yadm` klont das Repository und führt danach automatisch das `bootstrap`-Skript aus, das alle Tools und Schriftarten installiert.
    ```bash
    yadm clone DEIN-REPO-URL
    ```

3.  **(Nur bei SSH-Problemen) SSH-Key für GitHub einrichten:**
    *   Falls der `clone`-Befehl mit einem `Permission denied (publickey)`-Fehler fehlschlägt, muss ein neuer SSH-Schlüssel für GitHub eingerichtet werden.
    *   Folge [dieser Anleitung von GitHub](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/adding-a-new-ssh-key-to-your-github-account ).

---

### 🔄 Täglicher Arbeitsablauf

**Eine Änderung an der Konfiguration vornehmen:**

1.  **Datei direkt bearbeiten:**
    *   Ändere eine Konfigurationsdatei ganz normal an ihrem Speicherort.
    *   Beispiel: `nvim ~/.config/nvim/init.lua`

2.  **Änderung zu `yadm` hinzufügen:**
    *   Beispiel: `yadm add ~/.config/nvim/init.lua`

3.  **Commit erstellen:**
    *   `yadm commit -m "Beschreibe deine Änderung"`

4.  **Änderungen hochladen:**
    *   `yadm push`

**Änderungen auf einem anderen System empfangen:**

1.  **Updates abrufen:**
    *   Dieser Befehl holt die neuesten Änderungen aus dem Git-Repository.
    ```bash
    yadm pull
    ```

