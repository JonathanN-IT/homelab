# CT500 — Cybersécurité / OSINT

Conteneur dédié à la reconnaissance OSINT et à l'environnement Kali Linux.

## Environnement Kali Linux (Docker)

Bureau Kali Linux complet accessible via navigateur ou Guacamole.

| Accès | URL / Info |
|-------|-----------|
| **Web (noVNC)** | https://kali.rippers.be/vnc.html |
| **Guacamole (RDP)** | Connexion "Kali Linux" dans Guacamole |

### Stack Docker (`/opt/kali-desktop/`)

- Image custom : `kalilinux/kali-rolling` + `kali-desktop-xfce` + TigerVNC + noVNC + XRDP
- Compose : `/opt/kali-desktop/docker-compose.yml`
- Bureau : **Xfce4** (bureau par défaut de Kali)
- Utilisateur : `Rippers`

## Outils OSINT natifs

| Outil | Localisation | Usage |
|-------|-------------|-------|
| **SpiderFoot 4.0** | `/opt/spiderfoot/venv` — port 5001 | Reconnaissance automatisée |
| **Maigret** | `/opt/maigret/venv` | Recherche de comptes par pseudo |
| **Holehe** | `/opt/holehe_env` | Vérification d'emails |
| **Sherlock** | `/opt/sherlock_env` | Recherche de pseudos sur les réseaux |
| **theHarvester** | `/opt/theHarvester/venv` | Collecte d'emails/sous-domaines |
| **Recon-ng** | `/opt/recon-ng-env` | Framework de reconnaissance web |
| **Sublist3r** | apt | Énumération de sous-domaines |
| **ExifTool** | apt | Analyse de métadonnées |
| **kali-linux-headless** | apt (Kali rolling) | Suite complète outils pentest CLI |

## Services système

- **SpiderFoot** — `systemd` service, port 5001
- **Portainer CE** — Docker, ports 9000/9443
- **SSH** — port 22

## TODO

- [ ] Documenter un cas d'usage OSINT concret (audit d'un domaine de test)
- [ ] Lien vers le futur contenu IFAPME Cybersécurité (sept. 2026)
