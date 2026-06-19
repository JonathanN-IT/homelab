# Scripts d'automatisation

Scripts réels utilisés sur l'infrastructure (anonymisés avant publication : pas d'IP, domaine, token ou clé en dur).

## À ajouter ici

- `backup-vaultwarden.sh` — sauvegarde quotidienne SQLite + clé RSA + pièces jointes, rotation 7 jours (CT100)
- `cloudflare-dns-bulk.sh` — gestion des 13+ sous-domaines via l'API REST Cloudflare (CT101)

> Remplace les valeurs sensibles par des variables d'environnement (`$CF_API_TOKEN`, `$DOMAIN`, etc.) avant de publier un script.
