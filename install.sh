#!/usr/bin/env bash
# Installa la skill ats-cv-optimize in ~/.claude/skills/
set -euo pipefail

SRC="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/skills/ats-cv-optimize"
DEST="${CLAUDE_SKILLS_DIR:-$HOME/.claude/skills}/ats-cv-optimize"

if [ ! -d "$SRC" ]; then
  echo "Cartella della skill non trovata: $SRC" >&2
  exit 1
fi

mkdir -p "$(dirname "$DEST")"
if [ -d "$DEST" ]; then
  printf 'La skill è già installata in %s. Sovrascrivo? [s/N] ' "$DEST"
  read -r risposta
  case "$risposta" in
    [sS]|[sS][iìI]) rm -rf "$DEST" ;;
    *) echo "Annullato."; exit 0 ;;
  esac
fi

cp -R "$SRC" "$DEST"
echo "Skill installata in $DEST"

if python3 -c "import docx" >/dev/null 2>&1; then
  echo "python-docx già presente."
else
  echo
  echo "Il renderer DOCX richiede python-docx. Installalo con:"
  echo "    pip3 install python-docx"
fi

echo
echo "Riavvia Claude Code e prova a scrivere: «sistemami il curriculum»."
