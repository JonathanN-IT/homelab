# CT100 — Média & Cloud

Conteneur LXC regroupant les services de streaming, stockage et téléchargement automatisé.

## Services

| Service | Rôle |
|---------|------|
| **Plex** | Serveur multimédia personnel |
| **Jellyfin** | Streaming vidéo open-source |
| **Nextcloud** | Stockage cloud privé |
| **Vaultwarden** | Gestionnaire de mots de passe auto-hébergé |
| **Navidrome** | Streaming musical |
| **Jellyseerr** | Gestion des demandes de médias |
| **qBittorrent + Sonarr + Radarr + Lidarr + Prowlarr** | Stack de gestion automatisée des médias |
| **FlaresolverR** | Bypass Cloudflare pour indexeurs |
| **Threadfin** | Proxy IPTV/M3U |

## Sauvegardes

- **Vaultwarden** : backup automatique quotidien (2h00), rotation sur 7 jours.
  Script Bash dédié : sauvegarde SQLite + clé RSA + pièces jointes, compressé en `.tar.gz`.
  → voir [`../scripts/`](../scripts/)

## TODO

- [ ] Ajouter le `docker-compose.yml` réel (anonymisé : retirer domaines/IP/secrets)
- [ ] Documenter les choix d'architecture (pourquoi Plex + Jellyfin en parallèle, pourquoi cette stack *arr)
