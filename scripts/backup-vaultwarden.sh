#!/bin/bash
# Sauvegarde automatique Vaultwarden — rotation sur 7 jours
# Variables sensibles à définir dans l'environnement ou un fichier .env non versionné

BACKUP_DIR="${BACKUP_DIR:-/opt/backups/vaultwarden}"
DATA_DIR="${VAULTWARDEN_DATA:-/opt/vaultwarden/data}"
RETENTION_DAYS=7
DATE=$(date +%Y-%m-%d_%H-%M-%S)
ARCHIVE="$BACKUP_DIR/vaultwarden_$DATE.tar.gz"

mkdir -p "$BACKUP_DIR"

# Sauvegarde SQLite (db.sqlite3), clé RSA et pièces jointes
tar -czf "$ARCHIVE" \
    "$DATA_DIR/db.sqlite3" \
    "$DATA_DIR/rsa_key.pem" \
    "$DATA_DIR/rsa_key.pub.pem" \
    "$DATA_DIR/attachments/" \
    2>/dev/null

if [ $? -eq 0 ]; then
    echo "[$DATE] Sauvegarde OK : $ARCHIVE"
else
    echo "[$DATE] ERREUR lors de la sauvegarde" >&2
    exit 1
fi

# Rotation : supprime les archives de plus de N jours
find "$BACKUP_DIR" -name "vaultwarden_*.tar.gz" -mtime +$RETENTION_DAYS -delete
echo "[$DATE] Rotation effectuée (conservation : $RETENTION_DAYS jours)"
