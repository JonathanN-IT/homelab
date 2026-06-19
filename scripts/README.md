# Scripts d'automatisation

Scripts utilisés sur l'infrastructure — variables sensibles remplacées par des variables d'environnement.

| Script | Description |
|--------|-------------|
| [`backup-vaultwarden.sh`](backup-vaultwarden.sh) | Sauvegarde quotidienne Vaultwarden : SQLite + clé RSA + pièces jointes, rotation 7 jours |

## Utilisation

```bash
# Rendre exécutable
chmod +x backup-vaultwarden.sh

# Configurer les variables
export BACKUP_DIR="/opt/backups/vaultwarden"
export VAULTWARDEN_DATA="/opt/vaultwarden/data"

# Ajouter en cron (2h00 chaque nuit)
0 2 * * * /opt/scripts/backup-vaultwarden.sh >> /var/log/backup-vaultwarden.log 2>&1
```
