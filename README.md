# 🖥️ Homelab — Infrastructure Auto-Hébergée

Homelab construit de zéro dans le cadre de ma reconversion professionnelle vers
l'Administration Réseau & Systèmes, avec une spécialisation en virtualisation.
Hébergé sur un serveur dédié sous Proxmox VE, gérant plusieurs conteneurs LXC et services Docker.

---

## 🖥️ Configuration Matérielle

| Composant | Détail |
|-----------|--------|
| **Machine** | MEDION Akoya P5360 E |
| **CPU** | Intel Core i5-6402P @ 2.80GHz — 4 cœurs |
| **RAM** | 16 Go DDR4 |
| **SSD** | 120 Go Samsung (OS + Proxmox) |
| **HDD** | 3x 1 To (Seagate x2, WD x1) — données & médias |
| **Stockage total** | ~3.1 To |

---

## 🏗️ Architecture

```
Internet
    │
    ▼
Cloudflare (DNS + Tunnel)
    │
    ▼
┌─────────────────────────────────────────────────────┐
│                  Proxmox VE (Hôte)                  │
│                                                     │
│  CT100 - Média & Cloud    CT101 - Passerelle        │
│  CT102 - Web (Groinck)    CT103 - Web (Tatouage)    │
│  CT104 - Bureau Linux     CT105 - DNS (Pi-hole)     │
│  CT500 - Cybersec / OSINT                           │
└─────────────────────────────────────────────────────┘
```

---

## 🔒 Sécurité & Réseau

| Technologie | Rôle |
|------------|------|
| **Cloudflare Tunnel** | Aucun port exposé sur internet — trafic chiffré via tunnel |
| **Nginx Proxy Manager** | Reverse proxy + certificats SSL/TLS automatiques |
| **Pi-hole + DNSCrypt** | DNS local filtrant + chiffrement DNS |
| **Fail2ban** | Protection contre les attaques brute-force |
| **Vaultwarden** | Gestionnaire de mots de passe auto-hébergé |
| **Cloudflare DNS** | Gestion DNS avec 13+ sous-domaines |

> Tout le trafic externe transite par le tunnel Cloudflare — l'IP publique du serveur n'est jamais exposée.

---

## 📦 Conteneurs (LXC)

### CT100 — Média & Cloud
- **Plex** — Serveur multimédia personnel
- **Jellyfin** — Streaming vidéo open-source
- **Nextcloud** — Stockage cloud privé
- **Vaultwarden** — Gestionnaire de mots de passe
- **Navidrome** — Streaming musical
- **Jellyseerr** — Gestion des demandes de médias
- **qBittorrent + Sonarr + Radarr + Lidarr + Prowlarr** — Stack de gestion automatisée des médias
- **FlaresolverR** — Bypass Cloudflare pour indexeurs
- **Threadfin** — Proxy IPTV/M3U

### CT101 — Passerelle
Point d'entrée de l'infrastructure. Gère le routage de tout le trafic entrant.

- **Nginx Proxy Manager** — Reverse proxy avec SSL Let's Encrypt pour 13+ sous-domaines
- **Cloudflare Tunnel (cloudflared)** — Tunnel chiffré sans port ouvert
- **Apache Guacamole** — Passerelle d'accès distant (RDP/SSH/VNC via navigateur)
- **Homepage** — Dashboard de supervision de tous les services
- **Mealie** — Gestionnaire de recettes auto-hébergé

### CT102 — Hébergement Web (Groinck)
- **WordPress** (Groinck) + MariaDB — derrière Nginx Proxy Manager
- Nginx, PHP 8.3-FPM, Redis

### CT103 — Hébergement Web (Tatouage)
- **WordPress** (Tattoo-web) + MariaDB — derrière Nginx Proxy Manager

### CT104 — Bureau Linux & Sécurité
- **Environnement bureau Linux** accessible à distance via Guacamole (XRDP / noVNC)
- **Fail2ban** — Prévention active des intrusions

### CT105 — DNS Local
- **Pi-hole FTL** — Blocage publicités & tracking sur tout le réseau local
- **DNSCrypt-proxy** — Chiffrement des requêtes DNS sortantes

---

## 💾 Sauvegardes

- **Vaultwarden** — Backup automatique quotidien (2h00) avec rotation sur 7 jours
- Script Bash dédié : sauvegarde SQLite + clé RSA + pièces jointes compressées en .tar.gz
- **Proxmox** — Snapshots des conteneurs LXC

---

## 🌐 Domaine & DNS

- Domaine : rippers.be (enregistré chez one.com)
- DNS géré par **Cloudflare**
- 13 sous-domaines configurés, chacun routé via Cloudflare Tunnel → Nginx Proxy Manager

---

## 🛠️ Compétences Démontrées

- **Virtualisation** : Proxmox VE, conteneurs LXC, gestion des ressources
- **Réseau** : Gestion DNS, reverse proxy, SSL/TLS, tunnel Cloudflare, Pi-hole
- **Linux** : Administration système Debian/Ubuntu, services systemd
- **Docker** : Déploiements multi-conteneurs, gestion des volumes et du réseau
- **Cybersécurité** : OSINT, reconnaissance réseau, outils d'investigation
- **Automatisation** : Scripting Bash, API Cloudflare (gestion DNS en masse via REST API)
- **Sauvegardes** : Scripts Bash automatisés avec rotation, sauvegarde SQLite en ligne

---

## 📊 Dashboard de Supervision

Tous les services sont supervisés via un dashboard **Homepage** auto-hébergé sur home.rippers.be
avec statut ping en temps réel pour chaque service.

---

## 🎯 À Propos

Électricien en reconversion vers l'Administration Réseau & Systèmes, avec une spécialisation en **virtualisation**.
Ce homelab est mon environnement d'apprentissage pratique — chaque service, configuration
et décision technique a été recherché, implémenté et débogué par moi-même.

**Formation en cours** : Administrateur Réseau & Systèmes — Spécialisation Virtualisation

---

## 📫 Contact

- **Email** : rjnuttin@gmail.com
- **LinkedIn** : https://www.linkedin.com/in/jonathan-nuttin-it
