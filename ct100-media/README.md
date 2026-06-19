# CT100 — Média & Cloud

Conteneur LXC regroupant les services de streaming, stockage et téléchargement automatisé.

## Services

| Service | Rôle |
|---------|------|
| **Plex** | Serveur multimédia personnel |
| **Jellyfin** | Streaming vidéo open-source (alternative open source à Plex) |
| **Nextcloud** | Stockage cloud privé auto-hébergé |
| **Vaultwarden** | Gestionnaire de mots de passe (compatible Bitwarden) |
| **Navidrome** | Streaming musical |
| **Jellyseerr** | Gestion des demandes de médias |
| **qBittorrent + Sonarr + Radarr + Lidarr + Prowlarr** | Stack de gestion automatisée des médias |
| **FlaresolverR** | Bypass Cloudflare pour indexeurs |
| **Threadfin** | Proxy IPTV/M3U |

## Sauvegardes

- **Vaultwarden** : backup automatique quotidien à 2h00, rotation sur 7 jours
- Script Bash dédié : sauvegarde SQLite + clé RSA + pièces jointes compressées en `.tar.gz`
- → voir [`../scripts/backup-vaultwarden.sh`](../scripts/backup-vaultwarden.sh)

## Choix techniques

- **Plex + Jellyfin en parallèle** : Plex pour l'expérience mobile/TV, Jellyfin comme alternative 100% open source sans compte requis
- **Stack \*arr** : automatisation complète du cycle de vie des médias (recherche → téléchargement → organisation → streaming)
