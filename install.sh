#!/bin/sh
# Installer for the Sarah quizzes terminal program.
# Safe by design: this only downloads the program and marks it executable —
# it does NOT run the quiz. Read it before piping to sh if you like.
set -e

RAW="https://raw.githubusercontent.com/matthewkope/sarah-matchmaking/main/attachment-style-test"
DEST="${HOME}/.local/bin/sarah"

mkdir -p "$(dirname "$DEST")"
echo "Downloading the Sarah quizzes CLI…"
curl -fsSL "$RAW" -o "$DEST"
chmod +x "$DEST"

if ! command -v python3 >/dev/null 2>&1; then
  echo "Note: this program needs Python 3, but 'python3' wasn't found on your PATH."
fi
case ":$PATH:" in
  *":$HOME/.local/bin:"*) ;;
  *) echo "Note: add ~/.local/bin to your PATH — e.g. add this to ~/.zshrc or ~/.bashrc:"
     echo '      export PATH="$HOME/.local/bin:$PATH"' ;;
esac

echo "Installed to $DEST — run it with:  sarah"
