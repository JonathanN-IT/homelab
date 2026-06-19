# CT101 — Passerelle

Point d'entrée de l'infrastructure. Gère le routage de tout le trafic entrant.

## Services

| Service | Rôle |
|---------|------|
| **Nginx Proxy Manager** | Reverse proxy avec SSL Let's Encrypt pour 15+ sous-domaines |
| **Cloudflare Tunnel (cloudflared)** | Tunnel chiffré sans port ouvert sur internet |
| **Apache Guacamole** | Passerelle d'accès distant (RDP/SSH/VNC via navigateur) |
| **Homepage** | Dashboard de supervision de tous les services |
| **Mealie** | Gestionnaire de recettes auto-hébergé |
| **Grafana** | Monitoring & métriques |

## Guacamole — Connexions configurées

| Connexion | Protocole | Cible |
|-----------|-----------|-------|
| Proxmox Node | SSH | Hôte Proxmox |
| Gateway CT | SSH | CT101 |
| Plex CT | SSH | CT100 |
| Groinck CT | SSH | CT102 |
| tattoo-web CT | SSH | CT103 |
| debian-lab CT | SSH | CT104 |
| Satisfactory VM | SSH | VM Satisfactory |
| Zomboid VM | SSH | VM Zomboid |
| PC Windows — SSH | SSH | PC Windows |
| PC Windows — RDP | RDP | PC Windows |
| FortiGate | SSH | VM800 |
| Kali Linux | RDP | CT500 (port 3389) |

## Sécurité

> Tout le trafic externe transite par le tunnel Cloudflare — l'IP publique du serveur n'est jamais exposée.

- Certificats SSL/TLS automatiques via Nginx Proxy Manager (DNS challenge Cloudflare)
- Aucun port entrant ouvert sur le routeur (tunnel sortant uniquement)
- Fail2ban actif

## Sous-domaines actifs (15+)

`home`, `plex`, `tv`, `check`, `music`, `cloud`, `vault`, `guacamole`, `panel`,
`proxmox`, `pihole`, `linux`, `osint`, `code`, `cuisine`, `kali`, `ai`, `cv`,
`groinck`, `mig`, `zmap`, `zombi`, `factory`, `crowd`

## TODO

- [ ] Ajouter le `docker-compose.yml` réel (anonymisé)
- [ ] Schéma détaillé du flux : Cloudflare → Tunnel → NPM → service
