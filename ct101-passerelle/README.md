# CT101 — Passerelle

Point d'entrée de l'infrastructure. Gère le routage de tout le trafic entrant.

## Services

| Service | Rôle |
|---------|------|
| **Nginx Proxy Manager** | Reverse proxy avec SSL Let's Encrypt pour 13+ sous-domaines |
| **Cloudflare Tunnel (cloudflared)** | Tunnel chiffré sans port ouvert sur internet |
| **Apache Guacamole** | Passerelle d'accès distant (RDP/SSH/VNC via navigateur) |
| **Homepage** | Dashboard de supervision de tous les services |
| **Mealie** | Gestionnaire de recettes auto-hébergé |

## Sécurité

> Tout le trafic externe transite par le tunnel Cloudflare — l'IP publique du serveur n'est jamais exposée.

- Certificats SSL/TLS automatiques via Nginx Proxy Manager
- Aucun port entrant ouvert sur le routeur (tunnel sortant uniquement)

## Automatisation DNS

Gestion des 13+ sous-domaines via l'API REST Cloudflare.
→ voir [`../scripts/cloudflare-dns-bulk.sh`](../scripts/)

## TODO

- [ ] Ajouter le `docker-compose.yml` réel (anonymisé)
- [ ] Schéma détaillé du flux : Cloudflare → Tunnel → NPM → service
